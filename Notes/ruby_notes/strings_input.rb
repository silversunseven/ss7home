#! /usr/bin/ruby

=begin
   This is a multi-line comment
   and the 4 examples below show
   how in ruby everything is an object
=end

len="There is a place I want to go".length
puts len

rev="There is a place I want to go".reverse
puts rev

up="There is a place I want to go".upcase
puts up

down="There is a place I want to go".downcase
puts down


#MATH
sum=(13+379)
product=(923*15)
quotient=(13209/17)

puts sum, product, quotient


# method calls on strings
name="Pappichulo"
puts name.downcase.reverse.upcase


=begin
Take in input from script and manipulate it
and print it
=end

print "What is your first name?"
first_name = gets.chomp
first_name.capitalize!

print "What is your last name?"
last_name = gets.chomp
last_name.capitalize!

print "What city are you from ?"
city = gets.chomp
city.upcase!

print "how old are you ?"
age = gets.chomp

puts "You're name is #{first_name} #{last_name} and you are from #{city} and are #{age} years old"
