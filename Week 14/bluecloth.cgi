#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190508
# FILE: bluecloth.cgi
# DESC: Week 14 - A cgi script that uses the bluecloth rubygem to convert markdown into html

ENV['GEM_HOME']='/students/tbroderi/mygems'
$LOAD_PATH.unshift('/students/tbroderi/mygems/gems/bluecloth-2.2.0/lib/')
require 'bluecloth'

# Print CGI media type and blank line
puts "Content-type: text/html"
puts  # Need a blank line here

text_source = File.read('/users/dputnam/public_html/markdown_example.markdown.txt')
render_me = BlueCloth.new(text_source)
puts render_me.to_html

# CGI script can be viewed here: http://hills.ccsf.edu/~tbroderi/cs132a/bluecloth.cgi
