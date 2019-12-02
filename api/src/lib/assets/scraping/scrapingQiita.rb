require "mechanize"

class Assets::Scraping::ScrapingQiita
  def initialize
    @mecanizeAgent = Mechanize.new
  end

  def exec
    actorId = 21635734

    # TODO: 店舗リストを取得する
    brothels = generateBrothels()

    # TODO: 店舗に在籍している女優リストを作成する
    brothelActors = generateBrothelActors()

    # TODO: 女優の写メ日記ページをスクレイピングする
    # actorPage = scrapingActorDiaries("https://www.cityheaven.net/hokkaido/A0101/A010103/mikado/girlid-21635734/diary/")   

    # TODO: 写メ日記に掲載されている画像URLリストを作成する
    actorImageURLs = generateActorImageURLs("http://download.co.jp/news/newsplus/")
    # actorImageURLs.each do |element|
      # 「続きを読む」に対するリンクを取得したくないため、onclick属性を持つelementを除外
      # puts element[:href]
      # puts element.text
    # end

    # TODO: 女優の画像URLリストをDBに登録する
    upsertActorImageURLs()
  end

  def generateBrothels()
  end

  def generateBrothelActors()
  end

  # url: 写メ日記のトップページ
  # def scrapingActorDiaries(url)
    # return @mecanizeAgent.get(url)
  # end

  def generateActorImageURLs(url)
    actorPage = @mecanizeAgent.get(url)

    # 日記が投稿されている月数分、処理を回す
    diaryURLs = actorPage.search("a.CTRLbutton2")
    diaryURLs.each do |elmURL|
      # 「続きを読む」に対するリンクを取得したくないため、onclick属性を持つelementを除外
      next if elmURL[:onclick]
      puts elmURL.text

      # 各月の日記ページへのリンクをクリックし、ページ要素を取得
      diaryPage =　actorPage.link_with(href: elmURL[:href]).click

      # 日記に登録されている画像のURL一覧を取得して、配列に格納

    end

    # 返却用の配列に画像のURLリストを追加
    imgURLs = diaryURLs
    return imgURLs
  end

  def upsertActorImageURLs()
  end

end
