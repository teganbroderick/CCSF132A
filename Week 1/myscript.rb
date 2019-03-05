#!/usr/local/bin/ruby
# Name: Walter White and Jesse Pinkman (collaborators)
# Crs : CS 132A
# Sect: 831 
# File: myscript.rb
# Desc: My first ruby script.

1.upto(500) do |num|
  # Indentation is by convention two spaces.
  # print the num using sprintf formatting
  print "%3d " % num 

  # print a line break every 10 chars using the remainder operator
  puts  if num % 20 == 0
end
