require "mechanize"

mecanizeAgent = Mechanize.new
actorPage = mecanizeAgent.get("https://www.cityheaven.net/hokkaido/A0101/A010103/mikado/girlid-21635734/diary/date201911/")
elements = actorPage.search("article div a img")

elements.each do |element|
  puts element[:src]
end
