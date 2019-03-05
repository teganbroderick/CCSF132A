#!/usr/local/bin/ruby
# Name: Tegan Broderick
# Date: 2016-08-19 Fri
# File: elvish_to_english.cgi
# Desc: Assignment using String class methods to print Black Speech inscribed on
#       fireproof rings; requires Unicode for sure.


# Fetch the lab 1 working string into a variable named the_one_string
require 'resolv'
require "open-uri" # Use this library to do network requests
the_one_string = ""    # Initialize this string

# **** EXTRA IMPORTANT ********************************************

# When running the script on Hills, use 'localhost' as the domain,
# Like this:
the_url = "http://localhost/~dputnam/the_one_string.cgi"

# **** END OF EXTRA IMPORTANT *************************************

# When running this script anywhere but on Hills, use this code
# the_url = "http://hills.ccsf.edu/~dputnam/the_one_string.cgi"

# Concatenate all of the lines into the_one_string for use later
open(the_url) do |content|
    content.each_line { |line| the_one_string += line }
end

# SOME TEST CODE: This code tests whether we're really grabbing input from the remote URL.
# Comment the test output after you know your code is working.
puts
puts "BEGIN TESTING\n=============\n"
puts "THE STRING
========="
puts the_one_string                                   # Did we get the_one_string?
puts "\n------------\nNow let's print more information about the_string"
puts "The size: #{the_one_string.size}"               # How long is the string?
puts "Original encoding: #{the_one_string.encoding}"  # What's the encoding, Kenneth?

#If it's not UTF-8 we have to change it.
if the_one_string.encoding.to_s != 'UTF-8'
   puts '>>> Changing the encoding to Unicode'
   encoded = the_one_string.encode('utf-8')         # Convert to Unicode
   # Should be UTF-8 now. Check it.
   puts "Encoding is: #{encoded.encoding}"      # Should now be UTF-8.
end
puts "END TESTING (not part of the_string)"
# END TEST CODE #
