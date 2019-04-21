#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190413
# FILE: more_exceptions.rb
# DESC: Week 11: Script that creates and catches the following exceptions, printing the exception's message: ArgumentError, IndexError, NameError, NoMethodError, ZeroDivisionError, StringContainsTooManyZZZs (your custom Exception)


#Too many Zs
class TooManyZZZs < StandardError #TooManyZZZs inherits from Ruby's StandardError exception class
end

class My_String
  def initialize(string)
    if string.include? "zzzz"
      puts "String raising error is: #{string}"
      raise TooManyZZZs, "There you go again with your goofy 'z' obsession!"
    end
  end
end

z_strings = [ "You have marvelous skilzzzzzzz, my man!", "My propation officer had me cleanout the elephant compound at the zzzzzzzzzoo!", "Wouldn't it be funny if we woke up one day and the letter 'a' was replaced with 'z' and your name was 'Dzvid'?", "Only the guy who isn't rowing has time to rock the boat.", "No finite point has meaning without an infinite reference point.", "I love to watch my goofy friend guzzle his infinite beerzzzzz."]


z_strings.each do |i|
  begin
  temp_string = My_String.new(i) # create a new object in the My_String class

  rescue TooManyZZZs => e
    puts e.class
    puts e.message
    puts e.backtrace.join("\n")
    puts ""
  end
end


#Other exceptions
a = [1,2,3,4] #array to call on below

#Argument error
begin
puts a.first(-4)
rescue ArgumentError => e
  puts e.class
  puts e.message
  puts e.backtrace.join("\n")
  puts ""
end

#Index error
begin
puts a.fetch(7)
rescue IndexError => e
  puts e.class
  puts e.message
  puts e.backtrace.join("\n")
  puts ""
end

#Name error
begin
puts VariableThatDoesntExist
rescue NameError => e
  puts e.class
  puts e.message
  puts e.backtrace.join("\n")
  puts ""
end

#No method error
begin
puts a(-6)
rescue NoMethodError => e
  puts e.class
  puts e.message
  puts e.backtrace.join("\n")
  puts ""
end

#zero division error
begin
puts 60/0
rescue ZeroDivisionError => e
  puts e.class
  puts e.message
  puts e.backtrace.join("\n")
  puts ""
end
