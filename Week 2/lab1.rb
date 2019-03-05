#!/usr/local/bin/ruby
#Name: Tegan Broderick
#Crs: CS132A
#Sect: 831
#File: lab1.rb
#Desc: String Exercises

#Fetch the lab 1 working string into a variable named the_one_string
require "open-uri" # Use this library to do network requests
the_one_string = ""    # Initialize this string
the_url = "http://hills.ccsf.edu/~dputnam/the_one_string.cgi"

open(the_url) do |content|
    content.each_line { |line| the_one_string += line }
end


puts "7.1 Length of string:"
puts "#{the_one_string.length}"
puts ""

puts "7.2 Squeezed string:"
puts "#{the_one_string.gsub(/\s+/, ' ')}"
puts ""

puts "7.3 Lowercase string:"
puts " #{the_one_string.downcase}"
puts ""

puts "7.4 Uppercase string:"
puts "#{the_one_string.upcase}"
puts ""

puts "7.5 String without X as a last character on a line:"
string_array = []
string_array = the_one_string.split("\n") #splits the_one_string into an array for each line in the string

length = string_array.length #length of string array, ie number of lines

string_array_noX = [] #new array for each line with last letter X removed

#loop iterates through each item in the array (each original string line) If the last letter is X, it removes it
for i in 0..length-1
  temp_string = string_array[i]
  if temp_string[-1] == "X" #if last letter in string is x, remove it
    temp_string = temp_string.gsub(/.$/, '')
  end
  string_array_noX << temp_string
end

puts string_array_noX
puts ""

puts "7.6 Each byte:"
str_length = the_one_string.length

#iterates through each letter in the one string, prints letter, ordinal value and hex value
for i in 0..str_length-1
  letter = the_one_string[i]
  print letter #letter
  print ' '
  print letter.ord #ordinal value of letter
  print ' '
  ordinal_val = letter.ord
  hex_val = sprintf("%x", ordinal_val) #finds hex value from ordinal value
  puts hex_val
end
puts ""

puts "7.7 String converted to an array:"
puts "#{the_one_string.split}"
puts ""

puts "7.8 crypt"
puts the_one_string.crypt("aa")
puts ""

puts "7.9 Replace the contents of a String object"
puts "Object ID before replacing elements: #{the_one_string.object_id}"
temp_string = the_one_string.strip
temp_string = temp_string.reverse
temp_string = temp_string.gsub(/\s+/, ' ')
temp_string = temp_string.upcase

the_one_string[0,99] = temp_string

puts "Altered string: #{the_one_string}"
puts "Object ID after replacing elements: #{the_one_string.object_id}"
