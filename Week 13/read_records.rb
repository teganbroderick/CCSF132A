#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190426
# FILE: read_records.rb
# DESC: Reads records from fixed.data

fh = File.new('/students/tbroderi/public_html/cs132a/Week13/fixed.data','r')
rec_size = 109

fh.seek(0, IO::SEEK_END)
end_index = fh.tell() #total number of characters in the file
num_lines = end_index / rec_size #total number of lines in the file

#____________________________________________________________
puts "_" * 109
puts "Odd lines only"
puts "_" * 109

num_odd_lines = (num_lines / 2).to_i
fh.rewind #go back to start of file
fh.seek(rec_size, IO::SEEK_CUR) #seek to rec_size characters after first line
(0..num_odd_lines).each do
  puts(fh.read(rec_size))
  fh.seek(rec_size, IO::SEEK_CUR) #proceed to rec_size characters away from current location
end

#____________________________________________________________
puts "_" * 109
puts "Even lines only"
puts "_" * 109

num_even_lines = num_lines - num_odd_lines
fh.rewind #go back to start of file
(0..num_even_lines).each do
  puts(fh.read(rec_size))
  fh.seek(rec_size, IO::SEEK_CUR) #proceed to rec_size characters away from current location
end

#____________________________________________________________
puts "_" * 109
puts "Printing last five lines"
puts "_" * 109
lastFiveLines_index = 5 * rec_size
fh.seek(-lastFiveLines_index, IO::SEEK_END) #proceed to lastFiveLines_index characters before end

5.times do
  puts(fh.read(rec_size))
end
