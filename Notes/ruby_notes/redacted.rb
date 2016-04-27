#! /usr/bin/ruby
 
puts "Please enter the text: "
text=gets.chomp.downcase
#ARRAY words [this is a test]
 
puts "Words to be redacted: "
redacted_words=gets.chomp.downcase.split(" ")
#ARRAY redacted_words [is test]
 
redacted_words.each do |redword|
  #puts "DEBUG : redword is #{redword}"
  #puts "DEBUG : text is #{text}"
  text.gsub!(/ #{redword} /, " REDACTED ")
  #puts "DEBUG : text is #{text} (after sub)"
end
puts text
