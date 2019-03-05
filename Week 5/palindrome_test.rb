#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190305
# FILE: palindrome_test.rb
# DESC: Function determines whether a string in an array is a palindrome

palindromes = [
  "Dennis, Nell, Edna, Leon, Nedra, Anita, Rolf, Nora, Alice, Carol, Leo, Jane, Reed, Dena, Dale, Basil, Rae, Penny, Lana, Dave, Denny, Lena, Ida, Bernadette, Ben, Ray, Lila, Nina, Jo, Ira, Mara, Sara, Mario, Jan, Ina, Lily, Arne, Bette, Dan, Reba, Diane, Lynn, Ed, Eva, Dana, Lynne, Pearl, Isabel, Ada, Ned, Dee, Rena, Joel, Lora, Cecil, Aaron, Flora, Tina, Arden, Noel, and Ellen sinned.",
  "Depardieu, go razz a rogue I draped.",
  "Desserts I stressed.",
  'Mister, mister, on a see-saw with your sister.',
  "Detartrated.",
  "Devo met a Mr., eh, DNA and her mate moved.",
  "Di as dad said.",
  'abracadabra!',
  "Did I draw Della too tall, Edward? I did?",
  "Dior droid.",
  "'DNA-land.'",
  "Do geese see god?",
  'Do good? I? No. Evil anon I deliver. I maim nine more hero-men in Saginaw, sanitary sword a-tuck, Carol, I. Lo! Rack, cut a drowsy rat in Aswan. I gas nine more hero-men in Miami. Reviled, I (Nona) live on. I do, O God.',
  'Do nine men interpret?" "Nine men," I nod.',
  'Almost every sentence is NOT a palindrome! How unfair!'
]

def palindrome?(string)
  editedString = string.downcase.gsub /\W/, '' #string in lower case with everything except letters, digits or underscores removed
  reversedString = editedString.reverse #string reversed
  if editedString == reversedString
    true
  else
    false
  end
end

puts "3.1 and 3.2 - Palindromes"
puts "-"*20

# Test your palindrome method using this code.
palindromes.each do |pal|
  if palindrome?(pal)
    puts "Yes. #{pal} is a palindrome"
  else
    puts "#{pal} is not a palindrome. :("
  end
end

puts "" #for spacing whren outputting text
