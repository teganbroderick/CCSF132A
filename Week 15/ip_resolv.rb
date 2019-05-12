#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190512
# FILE: ip_resolv.rb
# DESC: Week 15 - Script finds and prints all of the IP addresses for the URLs found in the rails_sites.php page

require 'hpricot'
require 'open-uri'
require 'resolv'

# Use the imported open function to read rails_sites.php
source_html = open('http://hills.ccsf.edu/~dputnam/rails_sites.php').read

# Create an Hpricot object using the html read from rails_sites.php
html = Hpricot(source_html)

# Append URL for the <a> elements to url_array.
a_all = html.search('a')
url_array = []
a_all.each do |i|
  temp_url = i['href'].gsub('http://', '') #remove beginning of URL -> no IP addresses are generated below with the 'http://' prefix
  url_array << temp_url
end

#output
tmp = []
puts "Date: #{Time.now}"
url_array.each do |domain|
   tmp << "\n--- #{domain} ---"
   # Iterate through all of the IP addresses for domain
   Resolv.each_address(domain) do |ip|
     tmp << ip
   end
end
puts tmp
