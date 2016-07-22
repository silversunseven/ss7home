#! /usr/bin/ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

File.delete(*Dir.glob('file.*'))
link_list = ['http://www.wanderungen.ch/de/touren/wanderungen/berneroberland/Underi%20Trift%20Triftbr%C3%BCcke%20Windeggh%C3%BCtte%20SAC%20Underi%20Trift.html?tour=836','http://www.wanderungen.ch/de/touren/wanderungen/berneroberland/Schynige%20Platte-Faulhorn-First.html?tour=208']

cntr = 0
link_list.each do |httplink|
page = Nokogiri::HTML(open(httplink))
output = File.open( "file#{cntr}", "w" )

#  #idName
#  .className
puts "====================================================================================================="
puts "Link\t\t\t #{httplink}"
puts "====================================================================================================="

location = page.css('#content').css(".location").text
puts "Region\t\t\t #{location}" 
output << "Region\t\t\t #{location}\n" 

hikeName = page.css("title").text.gsub(/\s+/, "")
puts "Hike\t\t\t #{hikeName}"
output << "Hike\t\t\t #{hikeName}\n"

distanz = page.css('#content').css(".routeninfos").css(".table").css(".td")[10].text
distanzValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[11].text
puts "#{distanz}\t\t\t #{distanzValue}" 
output << "#{distanz}\t\t\t #{distanzValue}\n"

wanderzeit = page.css('#content').css(".routeninfos").css(".table").css(".td")[8].text
wanderzeitValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[9].text.gsub(/\s+/, "")
puts "#{wanderzeit}\t\t #{wanderzeitValue}" 
output << "#{wanderzeit}\t\t #{wanderzeitValue}\n"

aufsteig = page.css('#content').css(".routeninfos").css(".table").css(".td")[12].text
aufsteigValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[13].text.gsub(/\s+/, "")
puts "#{aufsteig}\t\t #{aufsteigValue}" 
output << "#{aufsteig}\t\t #{aufsteigValue}\n"

absteig = page.css('#content').css(".routeninfos").css(".table").css(".td")[14].text
absteigValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[15].text.gsub(/\s+/, "")
puts "#{absteig}\t\t\t #{absteigValue}" 
output << "#{absteig}\t\t\t #{absteigValue}\n" 

empfohlenesaison = page.css('#content').css(".routeninfos").css(".table").css(".td")[16].text
empfohlenesaisonValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[17].text
puts "#{empfohlenesaison}\t #{empfohlenesaisonValue}" 
output << "#{empfohlenesaison}\t #{empfohlenesaisonValue}\n" 

technik = page.css('#content').css(".routeninfos").css(".table").css(".td")[20].text
technikValue = page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[0]['title']
puts "#{technik}\t #{technikValue}" 
output << "#{technik}\t #{technikValue}\n" 
puts "----0----"
puts page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[0]['title']
puts "----1----"
puts page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[1]['title']
puts "----2----"
puts page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[2]['title']

panorama = page.css('#content').css(".routeninfos").css(".table").css(".td")[22].text
panoramaValue = page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[1]['title']
puts "#{panorama}\t\t #{panoramaValue}"
output << "#{panorama}\t\t #{panoramaValue}\n"

gesamterlebnis = page.css('#content').css(".routeninfos").css(".table").css(".td")[24].text
gesamterlebnisValue = page.css('#content').css(".routeninfos").css(".table").css(".td").css(".hidden-phone")[2]['title']
puts "#{gesamterlebnis}\t\t #{gesamterlebnisValue}" 
output << "#{gesamterlebnis}\t\t #{gesamterlebnisValue}\n" 

#besondereerlebnisse = page.css('#content').css(".routeninfos").css(".table").css(".td")[26].text
#besondereerlebnisseValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[27].text
#puts "#{besondereerlebnisse}\t\t #{besondereerlebnisseValue}"
#output << "#{besondereerlebnisse}\t\t #{besondereerlebnisseValue}\n"

standort = page.css('#content').css(".routeninfos").css(".table").css(".td")[30].text
standortValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[31].text
puts "#{standort}\t\t #{standortValue}" 
output << "#{standort}\t\t #{standortValue}\n" 

anreise_OEV = page.css('#content').css(".routeninfos").css(".table").css(".td")[32].text
anreise_OEVValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[33].text
puts "#{anreise_OEV}\t\t #{anreise_OEVValue}" 
output << "#{anreise_OEV}\t\t #{anreise_OEVValue}\n" 

zielort = page.css('#content').css(".routeninfos").css(".table").css(".td")[34].text
zielortValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[35].text
puts "#{zielort}\t\t\t #{zielortValue}" 
output << "#{zielort}\t\t\t #{zielortValue}\n" 

ruckreise_OEV = page.css('#content').css(".routeninfos").css(".table").css(".td")[36].text
ruckreise_OEVValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[37].text
puts "#{ruckreise_OEV}\t\t #{ruckreise_OEVValue}" 
output << "#{ruckreise_OEV}\t\t #{ruckreise_OEVValue}\n" 

#verpflegung = page.css('#content').css(".routeninfos").css(".table").css(".td")[38].text
#verpflegungValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[39].text.gsub(/\'/, "")
#puts "#{verpflegung}\t\t #{verpflegungValue}" 

#uebernachtung = page.css('#content').css(".routeninfos").css(".table").css(".td")[40].text
#uebernachtungValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[41].text
#puts "#{uebernachtung}\t\t #{uebernachtungValue}" 

#speziellehinweise = page.css('#content').css(".routeninfos").css(".table").css(".td")[42].text
#speziellehinweiseValue = page.css('#content').css(".routeninfos").css(".table").css(".td")[43].text
#puts "#{speziellehinweise}\t #{speziellehinweiseValue}" 

puts ""
puts "=RAW================================================="
output << page.css('#content').css(".routeninfos").css(".table").css(".td")

puts "=================================================="
puts
puts
puts
puts
puts
cntr += 1
output.close
end
