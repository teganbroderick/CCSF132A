#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190305
# FILE: anagram_function.rb
# DESC: #3.5 Finds anagrams in an array, sorts them into a hash, and outputs them

words = %W[Alan lana aaln bard brad drAb for ofr roF barE bear brae abet Bate beat brag gArb grab acme caME mace acre care race Cars raCs Scar arcs relish shilre shiler beta reac ceam TEAb]

def anagram(some_array)

  words_sorted = [] #create array for downcased words with their letters alphabetised
  some_array.each do |word|
    word = word.downcase.chars.sort.join #downcase, split into characters, characters sorted alphabetically, joined back into a string
    words_sorted << word
  end

  #create hash
  anagram_hash = {}
  #search for key, create key if it doesnt exist, and add values (anagram words from original array) to keys
  (0...words_sorted.length).each do |i|
    key = words_sorted[i]
    if anagram_hash.has_key?(key)
      anagram_hash[key].push(some_array[i])
   else
     anagram_hash[key] = [some_array[i]]
    end
  end
  puts ""
  puts "3.5 Anagram Function"
  puts "-"*20
#print out hash
  anagram_hash.each_value do |i|
    puts i.inspect
  end
end

#call function
anagram(words)
