#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190305
# FILE: sentence_paragraph_counter.rb
# DESC: Counts sentences and paragraphs in an accessed piece of text

#Text here https://hills.ccsf.edu/~dputnam/oliver.txt

fh = File.open('/users/dputnam/public_html/oliver.txt')
text = fh.read

#sentence count
def count_sentences(path_to_some_file)
  file_content = open(path_to_some_file).read() #"some_file" didnt work, and this was the only was i could get it to work
  sentence_count = file_content.split(/\.|\?|\!/).length
  if sentence_count > 0
    puts "Sentence count is #{sentence_count}"
  else
    false
  end
end

#paragraph count
def count_paragraphs(path_to_some_file)
  file_content = open(path_to_some_file).read()
  paragraph_count1 = file_content.split(/\n\n/).length
  paragraph_count2 = file_content.split(/\n\n\n/).length
  paragraph_count3 = file_content.split(/\n\n\n\n/).length
  total_paragraphs = paragraph_count1 + paragraph_count2 + paragraph_count3
  if total_paragraphs > 0
    puts "Paragraph count is #{total_paragraphs}"
  else
    false
  end
end

def main()
  puts "3.3 Sentence Counter"
  puts "-" * 20
  count_sentences('/users/dputnam/public_html/oliver.txt')
  puts "" #for spacing when outputting text

  puts "3.4 Paragraph Counter"
  puts "-" * 20
  count_paragraphs('/users/dputnam/public_html/oliver.txt')
  puts "" #for spacing when outputting text
end

main()
