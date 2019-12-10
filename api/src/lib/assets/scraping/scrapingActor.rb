require "mechanize"
require "activerecord-import"

class Assets::Scraping::ScrapingActor
  def initialize
    @mecanizeAgent = Mechanize.new
    # @mecanizeAgent.user_agent_alias = "Windows Mozilla"
  end

  def exec
    # TODO: 店舗エリア設定
    prefecture = "hokkaido"

    # 店舗リストを取得する
    brothels = generateBrothels(prefecture)
    brothels.each do |elementBrothel|
      puts elementBrothel[:brothel_name]
      # brothelsテーブルに値を格納する
      Brothel.upsert({
        brothel_name:      elementBrothel[:brothel_name],
        brothel_name_en:   elementBrothel[:brothel_name_en],
        brothel_url:       elementBrothel[:brothel_url],
        prefecture:        elementBrothel[:prefecture],
        prefecture_en:     elementBrothel[:prefecture_en],
        area_id:           elementBrothel[:area_id],
        area_detail_id:    elementBrothel[:area_detail_id],
        brothel_type_id:   elementBrothel[:brothel_type_id],
        brothel_type_name: elementBrothel[:brothel_type_name]
      })

      # 店舗に在籍している女優リストを作成する
      brothelActors = generateBrothelActors("#{elementBrothel[:brothel_url]}girllist/")
      # brothelActors = generateBrothelActors("https://www.cityheaven.net/hokkaido/A0101/A010103/mikado/girllist/")
      newActors = []
      brothelActors.each do |elementActor|
        brothel = Brothel.find_by(
          brothel_name:  elementBrothel[:brothel_name],
          prefecture_en: elementBrothel[:prefecture_en]
        )

        puts elementActor[:name]
        newActors << Actor.new(
          brothel_id:       brothel[:id],
          girl_id:          elementActor[:girl_id],
          name:             elementActor[:name],
          age:              elementActor[:age],
          tall:             elementActor[:tall],
          bust:             elementActor[:bust],
          cup:              elementActor[:cup],
          waist:            elementActor[:waist],
          hip:              elementActor[:hip],
          actor_page_url:   elementActor[:actor_page_url]
        )
      end
      Actor.import newActors, on_duplicate_key_update: [:actor_page_url]

      # 写メ日記に掲載されている画像URLリストを作成する
      brothel = Brothel.find_by(
        brothel_name:  elementBrothel[:brothel_name],
        prefecture_en: elementBrothel[:prefecture_en]
      )
      actors = Actor.where(brothel_id: brothel[:id])

      actors.each do |actor|
        newActorImages = []
        puts actor[:name]
        url = "https://www.cityheaven.net/#{brothel[:prefecture_en]}/#{brothel[:area_id]}/#{brothel[:area_detail_id]}/#{brothel[:brothel_name_en]}/girlid-#{actor[:girl_id]}/diary/"
        actorImages = generateActorImageURLs(url)

        # 写メ日記画像が存在しない場合には、写メ日記存在フラグをfalseに更新して、次のループ処理を実行
        if actorImages.length == 0
          actor.is_exist_diary = false
          actor.save
          next
        end

        actorImages.each do |elementActorImages|
          newActorImages << ActorImage.new(
            actor_id:    actor[:id],
            image_path:  elementActorImages[:image_path]
          )
        end
        ActorImage.import newActorImages, on_duplicate_key_update: [:image_path]
      end
    end
  end

  
  # シティヘブンネットに登録されている47都道府県のリンクリストを取得する関数
  # [return]
  # object
  # - name    : 県名
  # - name_en : 県名（アルファベット）
  # - href    : リンク先
  def generatePrefectures()
    url = "https://www.cityheaven.net"
    heavenPage = @mecanizeAgent.get(url)
    prefectures = []

    prefecturePages = heavenPage.search("dl dd")
    prefecturePages.each do |prefecturePage|
      prefecture = {}
      anker = prefecturePage.search("a")

      prefecture[:href]    = "#{url}#{anker[0][:href]}"
      prefecture[:name]    = anker[0].text
      prefecture[:name_en] = anker[0][:href].gsub(/\//, "")

      # お店が存在しない場合には、hrefに javascript:void(0) が指定されているため、このデータを除外する
      if prefecture[:name_en] != "javascript:void(0)"
        prefectures.push(prefecture)
      end
    end
    return prefectures
  end


  # エリア番号を取得して返却する関数
  # [params]
  # prefecture       : 県
  # [return]
  # areas
  # - prefecture    : 県名
  # - prefecture_en : 県名（アルファベット）
  # - href          : エリア番号（リンク先）
  def generateAreaID(prefecture)
    url = "https://www.cityheaven.net/#{prefecture}"
    heavenPage = @mecanizeAgent.get(url)
    areas = []

    areaPages = heavenPage.search("map area")
    areaPages.each do |areaPage|
      area = {}
      area[:prefecture]    = areaPage[:alt]
      area[:prefecture_en] = areaPage[:region]
      area[:href]          = areaPage[:href]
      areas.push(area)
    end
    return areas
  end

  # 業種に対応する "biz"番号を返却する

  # 店舗一覧を取得して、返却する関数
  # [params]
  # prefecture       : 店舗情報を取得する県
  # [return]
  # none: （Nokogiri::XML::Element） 
  def generateBrothels(prefecture)
    # TODO: エリア番号設定, 業種指定
    url = "https://www.cityheaven.net/#{prefecture}/A0101/A010103/shop-list/biz4/"
    heavenPage = @mecanizeAgent.get(url)
    brothels = []

    # 店舗一覧を取得
    brothelURLs = heavenPage.search("div.table-cell a.shop_title_shop")
    brothelURLs.each do |brothelDom|
      brothel = {}

      # 配列に値を格納
      # /都道府県/エリア番号/エリア詳細番号/店舗名 となっている文字列を"/"で分割
      splitHref = brothelDom[:href].split("/")
      brothel[:prefecture_en]     = splitHref[1]
      brothel[:area_id]           = splitHref[2]
      brothel[:area_detail_id]    = splitHref[3]
      brothel[:brothel_name_en]   = splitHref[4]
      splitUrl = url.split("/")
      brothel[:brothel_type_id]   = splitUrl[7]
      brothel[:brothel_name]      = brothelDom.text
      brothel[:brothel_url]       = "https://www.cityheaven.net/#{brothelDom[:href]}"

      # TODO: どこかから店舗種別を抜いてくる
      brothel[:brothel_type_name] = ""
      brothel[:prefecture]        = ""

      brothels.push(brothel)
    end
    
    return brothels
  end


  # 店舗に在籍する女優の一覧を取得して、返却する関数
  # [params]
  # url          : お店のトップページ
  # [return]
  # actorsURLsAll: 店に在籍する女優のリスト（Nokogiri::XML::Element） 
  def generateBrothelActors(url)

    actorsPage = @mecanizeAgent.get(url)
    # 女優リストを格納する変数
    actors = []
    pagesLinks = actorsPage.search("div.contensboxin ul.paging center a")

    # ページングがコンテンツ上部と下部に存在するため、割る2している。
    pagesCount = pagesLinks.length / 2
    # ページングが発生しない場合には1を入れる
    if pagesCount == 0
      pagesCount = 1
    end
    # お店のページング数分、処理を回す(「次の女の子へ」が表示されなくなるまでループ)
    1.upto pagesCount do |i|
      # 女優の数分、処理を回す
      actorsURLs = actorsPage.search("ul.girllist li div.girllistimg a")
      actorsURLs.each do |actorsURL|
        puts actorsURL[:href]
        actor = {}

        textArray = parseActorProfile(actorsURL.search("div.girllisttext").text())

        actor[:name]               = actorsURL.search("img")[0][:alt]
        actor[:actor_page_url]     = "https://www.cityheaven.net#{actorsURL[:href]}"
        splitHref = actorsURL[:href].split("/")
        actor[:girl_id]            = splitHref[5].gsub("girlid-", "")

        # プロフィール部分の取得漏れがある場合には、値の代入をスキップする
        if textArray.length == 6
          actor[:age]                = textArray[0].gsub("歳", "")
          actor[:tall]               = textArray[1].gsub("T", "")
          actor[:bust]               = textArray[2]
          actor[:cup]                = textArray[3].gsub(/\(|\)/, "")
          actor[:waist]              = textArray[4]
          actor[:hip]                = textArray[5]
        end
        actors.push(actor)

        # 次のページ　が存在する場合
        if i <= pagesCount
          actorsPage = @mecanizeAgent.get("#{url}#{i+1}/")
        end
      end
    end
    return actors
  end


  # 女優の写メ日記配下に保存されている画像のURLのリストを返却する関数
  # [params]
  # url       : 写メ日記のトップページ
  # [return]
  # imgURLsAll: 写メ日記の画像URLのリスト（Nokogiri::XML::Element） 
  def generateActorImageURLs(url)
    # 女優の写メリストを格納する変数
    imgURLsAll = []

    begin
      actorPage = @mecanizeAgent.get(url)
      
      # 日記が投稿されている月数分、処理を回す
      # TODO: 同月の中で複数ページ存在する場合のループ処理を追加
      diaryURLs = actorPage.search("div#diary_archives ul li a")
      diaryURLs.each do |elmURL|
        # href要素を持たないelementを除外
        next if !elmURL[:href]
        # 各月の日記ページへのリンクをクリックし、ページ要素を取得
        diaryPage = actorPage.link_with(href: elmURL[:href]).click
        diaryItemPage = diaryPage.search("article.diary_item")

        # 1月分の日記に登録されている画像のURL一覧を取得する
        diaryItemPage = diaryPage.search("article.diary_item div.diary_photoframe a img")
        diaryItemPage.each do |item|
          actorImage = {}
          imagePath = item[:src].gsub(/\?cache.*/, "")
          actorImage[:image_path]      = "https:#{imagePath}"
          imgURLsAll.push(actorImage) if actorImage.has_key?(:image_path)
        end
      end
    # 写メ日記が存在しない場合
    rescue Mechanize::ResponseCodeError => e
      puts e
    # 写メ日記が存在しない場合
    rescue NoMethodError => e
      puts e
    end

    return imgURLsAll
  end

  # 女優のプロフィールをパースして、年齢、スリーサイズ等を取得する関数
  def parseActorProfile(string)
    girlsText = string.gsub("更新", "")
    # ..歳よりも前の記述（名前部分）を削除
    girlsText = girlsText.gsub(/(.*)(?=.{2}歳)/, "").gsub(/(\n|\r)+/, "")
    # 末尾の改行文字を削除する
    girlsText = girlsText.gsub(/(\t|\　|\ |\n)+$/, "")
    girlsText = girlsText.gsub(/(\t|\　|\ |･)+/, ":::").gsub(/(\n)+/, "")
    actorProfile = girlsText.split(":::")

    return actorProfile
  end
end
