#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190224
# FILE: arr2cols.rb
# DESC: Lab 2, prints an array’s contents as formatted rows and columns

#1. Fetch the lab 1 working string into a variable named the_one_string
#require "open-uri" # Use this library to do network requests
#the_one_string = ""    # Initialize this string
#the_url = "http://hills.ccsf.edu/~dputnam/the_one_string.cgi"

#2. Add the pre-defined arrays here.
# A array containing Escargot player data
escargot_player_data = [
  # Column names: name, character, and points
  ['Jim','bullfrog',99],
  ['Mack the Knife','caterpillar',12],
  ['Willy','chihuahua',143],
  ['Trudy','bunny',3],
  ['Mary Lou','slow loris',1443],
  ['Sharon Stone','komodo dragon',8888],
]

#Employees array
employees = [
    #  Name Address City State SSN Telephone
    %w(Walter\ White 123\ Happy\ Home\ Drive Albuquerque NM 555-66-7777 505-123-4567 ),
    %w(Jesse\ Pinkman 43\ Cloudy\ Skies\ Parkway Albuquerque NM  666-12-3456, 505-888-9999 ),
    %w(Gustavo\ Fring 123\ Pollos\ Boulevard Albuquerque NM 565-32-3344 505-434-9001 ),
    %w(Tuco\ Salamanca 99\ Crystal\ Springs\ Lane Albuquerque NM 575-44-3553 505-776-0455 ),
    %w(Saul\ Goodman 9800\ Montgomery\ Blvd\ NE Albuquerque NM 585-19-9990 505-503-4455 )
]

#Artists Array
artists = [
   # column names
   %w( first_name last_name telephone address city state zip_code birthdate salary ),

   [ 'Vinh',
     'Tranh',
     '438-910-7449',
     '8235 Maple Street',
     'Wilmington',
     'VM',
     '29085',
     '9/23/63',
     '1200'
   ],

   [ 'William',
     'Kopf',
     '846-836-2837',
     '6937 Ware Road',
     'Milton',
     'PA',
     '93756',
     '9/21/46',
     '43500'
   ],

   [ 'Yukio',
     'Takeshida',
     '387-827-1095',
     '13 Uno Lane',
     'Ashville',
     'NC',
     '23556',
     '7/1/29',
     '57000'
   ],

   [ 'Zippy',
     'Pinhead',
     '834-823-8319',
     '2356 Bizarro Ave.',
     'Farmount',
     'IL',
     '84357',
     '1/1/67',
     '89500'
   ],
   [ 'Andy',
     'Warhol',
     '212-321-7654',
     '231 East 47th Street',
     'New York City',
     'NY',
     '10017',
     '8/6/1928',
     '2700000'
   ]
]

#all_arrays array
all_arrays = [ escargot_player_data, employees, artists ]

#Header
puts '#'*43
puts '#'*43
puts '#'*43
puts '#'*15 + ' arr2cols.rb ' + '#'*15
puts '#'*43
puts '#'*43
puts '#'*43

name_array_count = 0 #will increase with each loop and allow the correct array name to be printed

# Process the arrays
all_arrays.each do |arr|
  array_size = arr.size
  nested_array_size = arr[0].size
  maxarray = [] #array for storing max in each nested array
  name_array = ["Escargot Player Data", "Employees", "Artists"] #an array for storing the names of the nested arrays


  #find max value in each nested array
  (0...array_size).each do |i|
    max = 0
    (0...nested_array_size).each do |j|
      variable_length = arr[i][j].to_s.length #variable length
      if variable_length > max
        max = variable_length
      end
    end
    puts "max in this array #{max}"
    maxarray << max #stores max in maxarray
  end

  puts ""

  puts ('%' * 40) + (' ' * 3) + name_array[name_array_count] + (' ' * 3) + ('%' * 40)
  name_array_count += 1 #increase name array count

  #finds longest data
  longestdata = maxarray.max - 1
  puts "(Longest data: #{longestdata}  -- adding 2 for padding)"
  longestdata += 2

  puts ""

  #prints each item in nested array
  (0...array_size).each do |i|
    (0...nested_array_size).each do |j|
      variable_length = arr[i][j].to_s.length
      num_spaces = longestdata - variable_length #number of spaces printed to give even columns
      print arr[i][j].to_s + (" " * num_spaces)
    end
  puts ""

  end
  puts ""
end
