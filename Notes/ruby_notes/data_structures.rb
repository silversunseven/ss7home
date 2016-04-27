#! /usr/bin/ruby
=begin
# array has what's called an index. The first element gets index 0, the next gets index 1, the one after that gets index 2, and so on. We can access elements of the array directly through these numbers, like so:
array = [5, 7, 9, 2, 0]
array[2]
# returns "9", since "9"
# is at index 2
=end
 
multi_d_array = [[1,2,3,4],["a","b","c","d"],[9,8,7,6],[5,6,7,8]]
multi_d_array.each { |x| puts "#{x}\n" }
 
 
#iterating through an array[] and a hash{}
friends = ["Milhouse", "Ralph", "Nelson", "Otto"]
family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}
friends.each { |x| puts "#{x}" }
family.each { |x, y| puts "#{x}: #{y}" }
 
#OR :
languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
languages.each { |x| puts x }
 
#When iterating over hashes, we need two placeholder variables to represent each key/value pair.
 
