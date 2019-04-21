#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190421
# FILE: week12_files.rb
# DESC: A script that prints a recursive directory listing

#Get directory address, ARGV creates an array for anything entered on the command line after the ruby filename. Sample output uses /students/tbroderi/public_html/cs132a
directory_address_array = ARGV
directory_address = directory_address_array[0]

#if the user has added a directory argument in the commandline, this loop will run to change the directory. If not, the script will read the files in the current directory
require 'fileutils'
if directory_address_array.length != 0
  FileUtils.cd("#{directory_address}") #change directory to directory argument
end

#array of recursive filepaths for the directory
filepath_array = Dir.glob("**/*")

#mode, UID, filesize and mtime data
mode_array = []
uid_array = [] #UID for this should be the same value for each file, but i created an array for any case where this differed from file to file
filesize_array = []
mtime_array = []

filepath_array.each do |i|
  #mode
  temp_mode = File.stat("#{i}").mode
  mode_array << temp_mode
  #uid
  temp_uid = File.stat("#{i}").uid
  uid_array << temp_uid
  #file size
  temp_filesize = File.stat("#{i}").size.to_s
  filesize_array << temp_filesize
  #mtime
  stats = File.stat("#{i}")
  temp_mtime = stats.mtime.to_s.split[0]
  mtime_array << temp_mtime
end

#username data
username_array = []
require 'etc'
uid_array.each do |u|
  temp_name = Etc.getpwuid(u.to_i)[:name]
  username_array << temp_name
end

#output
puts "Mode    UserNam    Mod Time     Size      Path"
(0...filepath_array.length).each do |i|
  print mode_array[i]
  print "   "
  print username_array[i]
  print "   "
  print mtime_array[i]
  print "   "
  print filesize_array[i]
  spaces_needed = 10 - filesize_array[i].length #uniform layout for size column
  print " " * spaces_needed
  print filepath_array[i]
  puts ""
end
