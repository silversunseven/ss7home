#! /usr/bin/ruby
 
print "In what year where you born? : "
year = Integer(gets.chomp)
 
if year < 1970
then
  puts "You are older than I :("
elsif year > 1970
then
  puts "HA! I am older than you. I was born in 1970!"
else
  puts "hmm, well I guess we are the same age, at least i am smarter!"
end
 
 
 
print "Guess my number : "
user_num = Integer(gets.chomp)
 
unless user_num == 8
  puts "Nope! YOU LOOSE! : "
else
  puts "WELL DONE"
end
 
10 > 8 // true
8 > 10 // false
8 == 10 // false
8 != 10 // true
 
# test_1 should be true
test_1 = ( 1 == 1 ) && ( 6 > 4 )
 
# test_2 = should be true
test_2 = ( 100 <= 100 ) || ( 16 == 18 )
 
# test_3 = should be false
test_3 = ( 16 > 10 ) && ( 19 > 20 )
 
 
#(As a general rule, Ruby methods that end with ? evaluate to the boolean values true or false.)
 
print "Please enter a string : "
orig_user_input = gets.chomp
# .include method in action
if orig_user_input.include? "s"
then
    #.gsub is a global substittion method call
    orig_user_input.gsub!(/[sS]/, "th")
    puts " Result is #{orig_user_input}"
else
    puts "please use an s in your string !"
    print "Please enter a string : "
    orig_user_input = gets.chomp
    orig_user_input.gsub!(/s/, "th")
    puts " Result is #{orig_user_input}"
end
 
 
counter = 1
while counter < 11
  puts counter
  # two counter notation examples
  counter = counter + 1
  counter += 1
  counter -= 1
end
 
# we used three dots in the range; this tells Ruby to exclude the final number in the count
for num in 1...10
    puts num
end
 
puts ""
# if we use two dots, this tells Ruby to include the highest number in the range.
for num in 1..10
    puts num
end
 
 
loop { print "Hello, world!" }
#is the same as - do (to open the block) and end (to close it) and break when condition is met:
i = 0
loop do
  i += 1
  print "#{i}"
  break if i > 5
end
 
 
#The next keyword can be used to skip over certain steps in the loop. For instance, if we don't want to print out the even numbers, we can write:
for i in 1..5
  next if i % 2 == 0
  print i
end
 
#Array creation with []
#.each is an iteration module and in this example i use blah as the placeholder
odds = [1,3,5,7,9]
odds.each do |blah|
    blah = blah * 2
    print blah
end
 
# The .times method is like a super compact for loop: it can perform a task on each item in an object a specified number of times.
10.times { puts "I love bacon!" }
