#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190224
# FILE: arr_methods.rb
# DESC: Lab 2, array methods, 6.2 and 6.3

#Fetch the lab 1 working string into a variable named the_one_string
require "open-uri" # Use this library to do network requests
the_one_string = ""    # Initialize this string
the_url = "http://hills.ccsf.edu/~dputnam/the_one_string.cgi"

open(the_url) do |content|
    content.each_line { |line| the_one_string += line }
end

#calculations for length of arrays
array_of_chars = the_one_string.scan(/./m) #array of characters from the_one_string
arraylength = array_of_chars.length #arraychars length
array1length = arraylength / 3 #array 1 length
array2length = arraylength - array1length #array 2 length
array2start = array1length + 1 #starting point of array 2

#1
#array 1 - first third of characters
arr1 = []
(0...array1length).each do |i|
  arr1.push(array_of_chars[i])
end
puts "1. arr1"
puts arr1.inspect
puts ""

#2
#array 2 - remainder of characters
arr2 = []
(array2start..arraylength-1).each do |i|
  arr2.push(array_of_chars[i])
end
puts "2. arr2"
puts arr2.inspect
puts ""

#3
puts "3. The set of elements common to both arr1 and arr2, with no duplicates"
puts (arr1 & arr2).inspect
puts ""

#4
puts "4. The difference between arr1 and arr2"
puts (arr1 - arr2).inspect
puts""

#5
puts "5. The difference between arr2 and arr1"
puts (arr2 - arr1).inspect
puts""

#6
puts "6. Element at the end of arr1"
puts "\"#{arr1[-1]}\""
puts "Element at the end of arr2"
puts "\"#{arr2.last}\""
puts""

#7
puts "7. First element of arr1"
puts "\"#{arr1.first}\""
puts "First element of arr2"
puts "\"#{arr2.first}\""
puts""

#8
puts "8. arr2 to uppercase and remove all of the elements that consist of white space characters"
#change to uppercase
(0...arr2.length).each do |i|
  str = arr2[i].to_s.upcase
  arr2[i] = str
end
#remove whitespace
arr2.delete(" ")
arr2.delete("\t")
arr2.delete("\n")

#Insert arr2 into arr1 at index 100
arr1[100] = arr2
puts arr1.inspect
puts ""

#9
puts "9. Flatten arr1, then remove any white space characters"
arr1 = arr1.flatten
arr1.delete(" ")
arr1.delete("\t")
arr1.delete("\n")
puts "new array 1 #{arr1}"
puts ""

#10
puts "10. Using Array#collect!, add an exclamation point (!) to each element of arr1"
arr1 = arr1.collect {|x| x + "!"}
puts arr1.inspect
puts ""

#11
puts "11. Use Array#pop to remove the last element off the array. Print the removed element and print arr1"
removed_element = arr1[-1]
puts "Removed element is \"#{removed_element}\""
arr1.pop
puts "arr1 is #{arr1}"
puts ""

#12
puts "Insert the element popped off in previous step into position 0 (front) of the array"
arr1[0] = removed_element
puts arr1.inspect
puts ""

#13
puts "Using Array#select!, remove all of the elements that do not contain uppercase letters"
arr1 = arr1.select { |x|  x.downcase!  } #removes all elements that do not contain uppercase letters, but returns elements as lowercase

#loop changes everything in the new array back to uppercase
(0...arr1.length).each do |i|
  str = arr1[i].upcase
  arr1[i] = str
end
puts arr1.inspect
