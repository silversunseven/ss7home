#! /usr/bin/ruby
 
lunch_order = {
  "Ryan" => "wonton soup",
  "Eric" => "hamburger",
  "Jimmy" => "sandwich",
  "Sasha" => "salad",
  "Cole" => "taco"
}


lunch_order.each { |user, food|
puts lunch_order[user]
}
