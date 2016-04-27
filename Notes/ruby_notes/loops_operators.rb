#!/usr/bin/ruby
 
=begin
this is a string compare
=end
print "Integer Please : "
user_int = gets.chomp
if user_int > "0"
then
  puts "Your Integer is positive"
elsif user_int < "0"
then
  puts "Your Integer is negative"
else
  puts "You chose ZERO!"
end
 
  
 
=begin
this is a int compare
=end
print "Integer Please : "
user_int = Integer(gets.chomp)
if user_int > 0
then
  puts "Your Integer is positive"
elsif user_int < 0
then
  puts "Your Integer is negative"
else
  puts "You chose ZERO!"
end
 
=begin
unless is a nice way of evalutating false
example
== is equal to
!= is not equal
< less than
<= less than or equal to
> greater than
>= greater than or equal to
 
Boolean operators
true && true # => true
true && false # => false
false && true # => false
false && false # => false
 
true || true # => true
true || false # => true
false || true # => true
false || false # => false
 
!true # => false
!false # => true
=end
 
print "Integer Please : "
user_int = Integer(gets.chomp)
unless user_int == 0
  then
    puts "Your Integer is not zero"
else
    puts "You chose Zero!"
end
 
