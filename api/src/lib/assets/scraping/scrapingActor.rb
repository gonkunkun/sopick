require "mechanize"

class Assets::Scraping::ScrapingActor
  def initialize
    @mecanizeAgent = Mechanize.new
  end

  def exec
    # TODO: 店舗リストを取得する
    brothels = generateBrothels()

    # TODO: 店舗に在籍している女優リストを作成する
    brothelActors = generateBrothelActors()

    # TODO: 女優の写メ日記ページをスクレイピングする
    actorPage = scrapingActorDiaries()
    actorPage = @mecanizeAgent.get("https://www.cityheaven.net/hokkaido/A0101/A010103/mikado/girlid-21635734/diary/date201911/")    

    # TODO: 写メ日記に掲載されている画像URLリストを作成する
    actorImageURLs = generateActorImageURLs()
    elements = actorPage.search("article div a img")
    elements.each do |element|
      puts element[:src]
    end

    # TODO: 女優の画像URLリストをDBに登録する
    upsertActorImageURLs()
  end

  def generateBrothels()
  end

  def generateBrothelActors()
  end

  def scrapingActorDiaries()
  end

  def generateActorImageURLs()
  end

  def upsertActorImageURLs()
  end

end
