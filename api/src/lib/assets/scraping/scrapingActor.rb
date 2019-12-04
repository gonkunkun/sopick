require "mechanize"

class Assets::Scraping::ScrapingActor
  def initialize
    @mecanizeAgent = Mechanize.new
    # @mecanizeAgent.ca_file = "../../cacert.pem"
  end

  def exec
    actorId = 21635734

    # TODO: 店舗エリア設定
    prefecture = "hokkaido"

    # TODO: 店舗リストを取得する
    brothels = generateBrothels(prefecture)
    brothels.each do |element|
      puts element[:href]
    end

    # TODO: 店舗に在籍している女優リストを作成する
    brothelActors = generateBrothelActors("https://www.cityheaven.net/hokkaido/A0101/A010103/mikado/girllist/")
    brothelActors.each do |element|
      puts element[:href]
    end

    # TODO: 写メ日記に掲載されている画像URLリストを作成する
    # TODO: 女優分ループする処理にする
    actorImageURLs = generateActorImageURLs("https://www.cityheaven.net/hokkaido/A0101/A010103/mikado/girlid-21635734/diary/")
    actorImageURLs.each do |element|
      puts element[:src]
    end

    # TODO: 女優の画像URLリストをDBに登録する
    upsertActorImageURLs()
  end


  # 店舗に在籍する女優の一覧を取得して、返却する関数
  # [params]
  # prefecture       : 店舗情報を取得する県
  # [return]
  # none: （Nokogiri::XML::Element） 
  def generateBrothels(prefecture)
    url = "https://www.cityheaven.net/#{prefecture}/A0101/A010103/shop-list/biz4/"
    heavenPage = @mecanizeAgent.get(url)
    brothelURLsAll = []

    # 店舗一覧を取得
    brothelURLs = heavenPage.search("div.table-cell a.shop_title_shop")
    brothelURLs.each do |brothel|
      # 店舗情報を取得
      brothelURLsAll.push(brothel)
      # brothelsテーブルに値を格納する
      Brothel.upsert(
        {brothel_name: "test", brothel_url: "http://test.com", prefecture: "hokkaido"}
      )
    end

    return brothelURLsAll
  end


  # 店舗に在籍する女優の一覧を取得して、返却する関数
  # [params]
  # url          : お店のトップページ
  # [return]
  # actorsURLsAll: 店に在籍する女優のリスト（Nokogiri::XML::Element） 
  def generateBrothelActors(url)
    actorsPage = @mecanizeAgent.get(url)
    # 女優リストを格納する変数
    actorsURLsAll = []
    pagesLinks = actorsPage.search("div.contensboxin ul.paging center a")

    # ページングがコンテンツ上部と下部に存在するため、割る2している
    pagesCount = pagesLinks.length / 2
    # お店のページング数分、処理を回す(「次の女の子へ」が表示されなくなるまでループ)
    1.upto pagesCount do |i|
      puts i
      # 女優の数分、処理を回す
      actorsURLs = actorsPage.search("ul.girllist li div.girllistimg a")
      actorsURLs.each do |actorsURL|
        actorsURLsAll.push(actorsURL)
      end
    end
    return actorsURLsAll
  end


  # 女優の写メ日記配下に保存されている画像のURLのリストを返却する関数
  # [params]
  # url       : 写メ日記のトップページ
  # [return]
  # imgURLsAll: 写メ日記の画像URLのリスト（Nokogiri::XML::Element） 
  def generateActorImageURLs(url)
    actorPage = @mecanizeAgent.get(url)
    # 女優の写メリストを格納する変数
    imgURLsAll = []
    # 日記が投稿されている月数分、処理を回す
    diaryURLs = actorPage.search("div#diary_archives ul li a")
    diaryURLs.each do |elmURL|
      # href要素を持たないelementを除外
      next if !elmURL[:href]

      # 各月の日記ページへのリンクをクリックし、ページ要素を取得
      diaryPage = actorPage.link_with(href: elmURL[:href]).click

      # 1月分の日記に登録されている画像のURL一覧を取得する
      imgURLsOneMonth = diaryPage.search("article.diary_item div.diary_photoframe a img")
      imgURLsOneMonth.each do |imgURL|
        imgURLsAll.push(imgURL)
      end
    end
    return imgURLsAll
  end


  def upsertActorImageURLs()
  end

end
