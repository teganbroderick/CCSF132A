#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190512
# FILE: open_uri.rb
# DESC: Week 15 - script that reads the content of a URL and prints it to a text file

require 'open-uri'
f = open('http://hills.ccsf.edu/~dputnam/cs132a/form.cgi')
puts f.readlines.join
