#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190311
# FILE: lab3.rb
# DESC: Lab 3: A Text Analyzer Script. Analyzes .txt files and finds the number of lines, number of characters,
# number of characters exluding whitespace, number of words, number of sentences, number of paragraphs,
# top 7 "ideal sentences", average number of words per sentence, percentage of meaningful words, percentage of
# non-meaningful words, and the top 10 most frequent meaningful words.

#header
puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-"
puts "Lab 3 Text Analyzer"
puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-"
puts ""

# Read names of all the speech files and process the files one at a time
# This code assumes that you've unzipped the zip file in your public_html/cs132a directory
Dir.glob('/students/tbroderi/public_html/cs132a/Week6/inaugural_addresses/*.txt').each do |speech|

  #Header
  fh = File.open(speech)
  text = fh.read

  text_array_by_line = text.split(/\n/) #splits text into array by lines. filename is always first line, or array[0]
  first_line_num_chars = text_array_by_line[0].length #num characters in the first line
  first_line_num_words = text_array_by_line[0].split.length #num words in the first line

  filename_array = speech.split("/") #split filename string on "/"
  filename = filename_array[7] #filename is last element in the array
  puts ""

  #Header output
  puts "=" * 60
  puts ""
  puts "Statistics for #{text_array_by_line[0]}"
  puts "File: #{filename}"
  puts ""

  #---------------------------------------------------------------------
  #arrays needed for statistic output
  header_array = ["Lines", "Chars", "Chars (no space)", "Words", "Sentences", "Paragraphs", "Words/sentence", "Non-fluff", "Fluff"]
  line_array = ["-----", "-----", "----------------", "-----","---------", "----------", "--------------", "---------", "-----"]
  statistic_array = []

  #---------------------------------------------------------------------
  # Exercises
  #1 Number of lines (Number of lines in the speech, where lines are separated by a newline character (\n).)
  num_lines = text.split(/\n/).length
  statistic_array << num_lines

  #2 Number of characters (Number of characters including white space characters.)
  num_characters = text.length - first_line_num_chars
  statistic_array << num_characters

  #3 Number of characters (Number of characters excluding white-space characters, including spaces, \n, \t, and \r. White-space characters match the POSIX character bracket [[:space:]].)
  num_characters_no_whitespace = text.delete(" ").length - first_line_num_chars
  statistic_array << num_characters_no_whitespace

  #4 Number of words (Number of words where words are defined as a sequence of the characters matched this regular expression [[:alpha:]']]. This character set matches alphabetical characters and contractions. You may use a different method for separating the text into words but it must be at least as accurate as using [[:alpha:]']+. Here’s an example of how to use this character set:)
  num_words = text.downcase.scan(/[[:alpha:]']+/).length - first_line_num_words
  statistic_array << num_words

  #5 Number of sentences (Number of sentences where sentences end with a “.” (period), “!” (exclamation point), or “?” (question mark).
  num_sentences = text.split(/\.|\!|\?/).length #header doesnt count as a sentence because it doesnt end with punctuation
  statistic_array << num_sentences

  #6 Number of paragraphs (Number of paragraphs with paragraphs ending with two or more consecutive newlines \n\n, \n\n\n, or \n\n\n\n, etc.)
  num_paragraphs = text.split(/\n\n/).length - 1
  statistic_array << num_paragraphs

  #7 Seven ideal sentences (Seven sentence extract containing 7 sentences chosen from the ideal sentences array. (The ideal_sentence array is part of the textbook’s code. See p. 89.). Modify the criteria used to determine ideal sentences to include the words was, have, is, are, were, had, and am.)
  #From Beginning Ruby book, pg. 87
  sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
  sentences_sorted = sentences.sort_by {|sentence| sentence.length}
  one_third = sentences_sorted.length / 3
  ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
  ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are|was|have|were|had|am/ }

  #8 Average words per sentence (Average number of words per sentence — make this number an integer.)
  av_per_sentence = (num_words / num_sentences).to_i
  statistic_array << av_per_sentence

  #9 Percentage of useful words (The percentage of “useful” (non-fluff) words as determined by comparing the words in the speech to the words in the stop_words array. For this assignment use the list of stop words here: http://hills.ccsf.edu/~dputnam/stop_words.txt.)
  text_words = text.downcase.scan(/\w+/)
  text_words_length = text_words.length
  #stop words
  stop_words = File.read('/students/tbroderi/public_html/cs132a/Week6/stop_words.txt').split("\r")

  #non fluff array
  meaningful_words = text_words - stop_words

  #non fluff length and percentage
  meaningful_words_length = meaningful_words.length
  meaningful_words_percentage = ((meaningful_words_length.to_f / text_words_length.to_f) * 100).round(2) #2 decimal places
  meaningful_words_percentage_display = meaningful_words_percentage.to_s + "%" #changes f to s so that i can add a percentage sign for display
  statistic_array << meaningful_words_percentage_display

  non_meaningful_words_percentage = (100.00 - meaningful_words_percentage).round(2) #2 decimal places
  non_meaningful_words_percentage_display = non_meaningful_words_percentage.to_s + "%" #changes f to s for display
  statistic_array << non_meaningful_words_percentage_display

  #10 10 most frequent useful words (Display the 10 most frequent useful words in each speech. No stop words are allowed in the 10-most-useful-words list. Your script should not count words like “it”, “and”, and “the” — they do not convey meaning and should not be counted.)

  top10_hash = {} #hash for sorting meaningful words by identical strings
  #search for key, create key if it doesnt exist, and add values to keys
  (0...meaningful_words.length).each do |i|
    key = meaningful_words[i]
    if top10_hash.has_key?(key)
      top10_hash[key].push(meaningful_words[i])
   else
     top10_hash[key] = [meaningful_words[i]]
    end
  end

  top10_array = [] #array for hash values
  top10_array = top10_hash.values #append hash values to array (as nested arrays)
  top10_array = top10_array.sort_by(&:size).reverse #sorts nested arrays from largest to smallest

  #---------------------------------------------------------------------
  #Output
  #Print statistics - header row
  header_array.each do |i|
    print i
    print "  "
  end
  puts ""

  #Print statistics - separating line row
  line_array.each do |i|
    print i
    print "  "
  end
  puts ""

  #Print statistics - values for each header
  (0...statistic_array.length).each do |i|
    print statistic_array[i]
    spaces_needed = (header_array[i].length + 2) - statistic_array[i].to_s.length
    print (" " * spaces_needed)
  end

  #spacing
  puts ""
  puts ""
  puts ""

  #Abstract
  puts "ABSTRACT"
  puts "-" * 8

  (0...7).each do |i| #prints ideal sentences
    puts "#{i + 1}. #{ideal_sentences[i]}"
  end

  #spacing
  puts ""
  puts ""
  puts ""

  #Ten most common meaningful words
  puts "THE TEN MOST COMMON SIGNIFICANT WORDS"
  puts "-" * 30

  (0...10).each do |i| #prints 10 most common meaningful words
    puts "#{top10_array[i][0]} (#{top10_array[i].length})"
  end

  puts ""
  puts "FULL TEXT: #{speech}" #prints path to file
  puts ""
  puts ""

end
