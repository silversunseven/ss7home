#! /usr/bin/ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

SQLite3::Database.new "hiker.db"
db = SQLite3::Database.open "hiker.db"
db.execute "DROP TABLE hikes"
db.execute "CREATE TABLE IF NOT EXISTS hikes(region varchar, hike varchar, link varchar, distanz varchar, wanderzeit varchar, aufsteig varchar, absteig varchar, empfohlenesaison varchar, technikRating varchar, panoramicRating varchar, gesamterlebnisRating varchar, besondereerlebnisse varchar, standort varchar, anreise_OEV varchar,zielort varchar, ruckreise_OEV varchar, verpflegung varchar)"

puts "DEBUG : Retrieving top50"
PAGE_URL_LIST = "http://www.wanderungen.ch/de/top-wanderungen-der-schweiz/top-wandervorschlaege.html"
pagelist = Nokogiri::HTML(open(PAGE_URL_LIST))
topFiftyURLS = []
i=0
loop do
        url = pagelist.css(".bodytext").css('h2 a')[i]["href"]
	topFiftyURLS << url
        i += 1
        break if i > 49
end

#print topFiftyURLS
puts "DEBUG : top50 array built"

topFiftyURLS.each do |httplink|
puts httplink
page = Nokogiri::HTML(open(httplink))

# Reset variables
location = 'x'
hikeName = 'x'
distanz = 'x'
distanzValue = 'x'
wanderzeit = 'x'
wanderzeitValue = 'x'
aufsteig = 'x'
aufsteigValue = 'x'
absteig = 'x'
absteigValue = 'x'
empfohlenesaison = 'x'
empfohlenesaisonValue = 'x'
technik = 'x'
technikValue = 'x'
panorama = 'x'
panoramaValue = 'x'
gesamterlebnis = 'x'
gesamterlebnisValue = 'x'
besondereerlebnisse = 'x'
besondereerlebnisseValue = 'x'
standort = 'x'
standortValue = 'x'
anreise_OEV = 'x'
anreise_OEVValue = 'x'
zielort = 'x'
zielortValue = 'x'
ruckreise_OEV = 'x'
ruckreise_OEVValue = 'x'
verpflegung = 'x'
verpflegungValue = 'x'
#speziellehinweise = 'x'
#speziellehinweiseValue = 'x'
			     
#  #idName
#  .className
			      
#puts page.css('#content').css(".routeninfos").css(".table").css(".td")
location = page.css('#content').css(".location").text
hikeName = page.css("title").text.gsub(/\s+/, "").gsub(/\|wanderungen.ch/, "")
distanz = page.css('#content').css(".routeninfos").css(".table").css(".td")[10].text
distanzValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[11].text
wanderzeit = page.css('#content').css(".routeninfos").css(".table").css(".td")[8].text
wanderzeitValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[9].text.gsub(/\s+/, "")
aufsteig = page.css('#content').css(".routeninfos").css(".table").css(".td")[12].text
aufsteigValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[13].text.gsub(/\s+/, "")
absteig = page.css('#content').css(".routeninfos").css(".table").css(".td")[14].text
absteigValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[15].text.gsub(/\s+/, "")
empfohlenesaison = page.css('#content').css(".routeninfos").css(".table").css(".td")[16].text
empfohlenesaisonValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[17].text
technik = page.css('#content').css(".routeninfos").css(".table").css(".td")[20].text
technikValue = page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[0]['title']
panorama = page.css('#content').css(".routeninfos").css(".table").css(".td")[22].text
panoramaValue = page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[1]['title']
gesamterlebnis = page.css('#content').css(".routeninfos").css(".table").css(".td")[24].text
gesamterlebnisValue = page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[2]['title']
besondereerlebnisse = page.css('#content').css(".routeninfos").css(".table").css(".td")[26].text
besondereerlebnisseValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[27].text
standort = page.css('#content').css(".routeninfos").css(".table").css(".td")[30].text
standortValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[31].text
anreise_OEV = page.css('#content').css(".routeninfos").css(".table").css(".td")[32].text
anreise_OEVValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[33].text
zielort = page.css('#content').css(".routeninfos").css(".table").css(".td")[34].text
zielortValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[35].text
ruckreise_OEV = page.css('#content').css(".routeninfos").css(".table").css(".td")[36].text
ruckreise_OEVValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[37].text
verpflegung = page.css('#content').css(".routeninfos").css(".table").css(".td")[38].text
verpflegungValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[39].text.gsub(/\'/, "")
#speziellehinweise = page.css('#content').css(".routeninfos").css(".table").css(".td")[42].text
#speziellehinweiseValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[43].text


#puts "Hike\t\t\t #{hikeName}"
#puts "Link\t\t\t #{httplink}"
#puts "#{distanz}\t\t\t #{distanzValue}" 
#puts "Region\t\t\t #{location}" 
#puts "#{wanderzeit}\t\t #{wanderzeitValue}" 
#puts "#{aufsteig}\t\t #{aufsteigValue}" 
#puts "#{absteig}\t\t\t #{absteigValue}" 
#puts "#{empfohlenesaison}\t #{empfohlenesaisonValue}" 
#puts "#{technik}\t #{technikValue}" 
#puts "#{panorama}\t\t #{panoramaValue}" 
#puts "#{gesamterlebnis}\t\t #{gesamterlebnisValue}" 
#puts "#{besondereerlebnisse}\t #{besondereerlebnisseValue}" 
#puts "#{standort}\t\t #{standortValue}" 
#puts "#{anreise_OEV}\t\t #{anreise_OEVValue}" 
#puts "#{zielort}\t\t\t #{zielortValue}" 
#puts "#{ruckreise_OEV}\t\t #{ruckreise_OEVValue}" 
#puts "#{verpflegung}\t\t #{verpflegungValue}" 
#puts "#{speziellehinweise}\t #{speziellehinweiseValue}" 
#puts ""
#puts "=================================================="


puts "Inserting the following :"
puts "1 region\t\t #{location}"
puts "2 hike\t\t\t #{hikeName}"
puts "3 link\t\t\t #{httplink}"
puts "4 distanz\t\t #{distanzValue}"
puts "5 wanderzeit\t\t #{wanderzeitValue}"
puts "6 aufsteig\t\t #{aufsteigValue}"
puts "7 absteig\t\t #{absteigValue}"
puts "8 empfohlenesaison\t #{empfohlenesaisonValue}"
puts "9 technikRating\t\t #{technikValue}"
puts "10 panoramicRating\t #{panoramaValue}"
puts "11 gesamterlebnisRating\t #{gesamterlebnisValue}"
puts "12 besondereerlebnisse\t #{besondereerlebnisseValue}"
puts "13 standort\t\t #{standortValue}"
puts "14 anreise_OEV\t\t #{anreise_OEVValue}"
puts "15 zielort\t\t #{zielortValue}"
puts "16 ruckreise_OEV\t #{ruckreise_OEVValue}"
puts "17 verpflegung\t\t #{verpflegungValue}"
db.execute "INSERT INTO hikes VALUES('#{location}','#{hikeName}','#{httplink}','#{distanzValue}','#{wanderzeitValue}','#{aufsteigValue}','#{absteigValue}','#{empfohlenesaisonValue}','#{technikValue}','#{panoramaValue}','#{gesamterlebnisValue}','#{besondereerlebnisseValue}','#{standortValue}','#{anreise_OEVValue}','#{zielortValue}','#{ruckreise_OEVValue}','#{verpflegungValue}')"
#Zentralschweiz|HöhenwanderungvomBrienzerRothornüberdenArnihaaggen|http://www.wanderungen.ch/de/touren/wanderungen/zentralschweiz/Brienzer%20Rothorn-Arnihaaggen-Gibel-Br%C3%BCnigpass.html?tour=301|11 km|4Std.|221m|1511m|Juli - Oktober|T2 (Bergwandern)|5 (grandiose Panoramatour)|5 (das Beste vom Besten)|Dampfbahn aufs Brienzer Rothorn, Panorama|Brienzer Rothorn|Brienzer Rothorn LSBR|Bahnhof Brünig-Hasliberg|Brünig-Hasliberg|Brienzer Rothorn, Brünigpass,Sörenberg, Lungern, Brienz
row = db.execute ( "SELECT * from hikes where hike = '#{hikeName}';" )
#print "#{row}\n"
puts "=================================================="
puts ""

end


