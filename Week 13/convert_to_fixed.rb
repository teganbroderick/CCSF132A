#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190426
# FILE: convert_to_fixed.rb
# DESC:Week 13 - Create a data file that uses fix-sized records to store data

#read file
lines = File.open('/pub/cis/dputnam/cs132a/wk13_data.txt', 'r').readlines
lines.shift #delete header row

template = "%15s%15s%20s%25s%17s%4s%13s" # Total of 109 characters per fixed record

file_obj = File.open("fixed.data", 'w')
lines.each do |i|
  parts = i.split(':')
  #change birthdate to have a four digit year
  temp_birthdate = parts[6].chomp
  if temp_birthdate[-3] == "/" #if birthdate is only two numbers, "/" will be at position -4
    temp_birthyear_last_two_nums = temp_birthdate[-2..-1].chomp #find last two numbers ie last two indexes of string, chomp off /n
    temp_birthyear_new = "19" + temp_birthyear_last_two_nums #make new variable for birthyear with four numbers
    temp_birthdate[-2] = temp_birthyear_new #append to end of string, overwriting two digit birthdate
    temp_birthdate = temp_birthdate.chop #remove last character which is appearing with my code
    parts[6] = temp_birthdate #assign new birthdate with 4 digit year to parts[6], with extra charater at the end removed
  else
    parts[6] = temp_birthdate #assign new birthdate with /n chomped off for formatting
  end
  file_obj.print template % [parts[1],parts[0],parts[2],parts[3],parts[4],parts[5],parts[6]]
end
file_obj.close
