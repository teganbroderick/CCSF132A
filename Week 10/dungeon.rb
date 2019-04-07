#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190406
# FILE: dungeon.rb
# DESC: Week 10 - Dungeon text adventure game from Beginning Ruby book

class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player=Player.new(player_name)
    @rooms  = []
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location=location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "\n You go " + direction.to_s + "\n\n"
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end

  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name +": " + "You are " + @description + "\n\n"
    end

  end
end

#get username, create new dungeon
puts "Welcome to the dungeon adventure game"
puts "What is your name?"
user_name = gets.chomp
my_dungeon = Dungeon.new(user_name)

#Add rooms
#Middle level of maze
my_dungeon.add_room(:largecave, "Large Cave", "in a large, cavernous cave. To the west is a small cave. To the east is a passageway from which you can hear the faint sound of cats meowing. There is a ladder going up and out of the cavern, and another ladder going down. Which direction do you want to go?", { :west => :smallcave, :east => :catcave, :up => :mountaintop, :down => :tinycave})

my_dungeon.add_room(:smallcave, "Small Cave", "in a small, claustrophobic cave. To the east is a larger cave. To the south is a passage to a beach. Which direction do you want to go?", { :east => :largecave, :south => :beach})

my_dungeon.add_room(:beach, "Beach", "on a small beach in a deserted cove. A gloomy sky hangs overhead. The clouds open up and drench you with rain. Go north into the cave!", {:north => :smallcave})

my_dungeon.add_room(:catcave, "Cat Cave", "in a large cave containing hundreds of friendly cats. They surround you and try to nudge you towards a dark, eastward passage. To the north there is a small hole in the side of the cave with a vine growing through it. To the west is a large cave. Which direction do you want to go - east, west, or north?", {:west => :largecave, :east => :kingofcats, :north => :jungle})

my_dungeon.add_room(:kingofcats, "King of Cats", "in a giant, cathdral-like cave with a throne against the far wall. You walk towards it. Silence comes over the cave, and a megafauna cat king emerges from the shadows. He sits on the throne as two smaller cats take you hostage. They bite your arms and you collapse helplessly to the ground. You try to get back on your feet, but your soft, furry front paws are planted firmly on the ground. You are now a cat, and this cave is now your home. The end.", {:west => :catcave})

my_dungeon.add_room(:jungle, "Jungle", "in the jungle. Humidity hits you in the face as you tear through tropical plants and vines, trying to find your way forward. To the north lays a dense path of plants. To the south, a path leads to a narrow opening in the rocks, from which you can hear the faint sound of cats meowing. Which direction to you want to go?", {:north => :atrium, :south => :catcave})

my_dungeon.add_room(:atrium, "Atrium", "standing outside an enormous Victorian glass greenhouse. Ornate stained glass panels line the walls. You open the front door and step inside. Lines of potted exotic tropical plants stretch as far as the eye can see. You decide to stay and tend to the plants, happily living out your days. The end.", {:south => :jungle})

#Top level of maze
my_dungeon.add_room(:mountaintop, "Mountain Top", "on a mountain top. To the east, jagged, snow-covered peaks reach as far as the eye can see. To the west, a path runs down between two boulders, leading to a far away tent in the distance. There is a ladder next to you going down into a cave. Which direction do you want to go?", {:west => :campsite, :east => :hangglider, :down => :largecave})

my_dungeon.add_room(:campsite, "Camp Site", "at a campsite. It is completey deserted except for one small, red tent. You approach the tent cautiously and upzip the door. Inside you find everything you need to comfortably live out your days. You spend the rest of your life on the mountain. The end.", {:west => :mountaintop})

my_dungeon.add_room(:hangglider, "Hang Glider", "on a jagged mountain peak. A hang glider sits on a flat rock next to you. To the west is the mountaintop from which you came. To the south is a deserted beach, which you can glide to by grabbing onto the hang glider and throwing yourself off the peak. Which way do you want to go?", {:west => :mountaintop, :south => :beach})

#Lower level of maze
my_dungeon.add_room(:tinycave, "Tiny Cave", "in a tiny cave. It is so small that you can barely move around. To the south is a pitch-black tunnel, and to the east is a narrow passage with a faint glow coming out of it. To the north is a ladder going up and out of the tiny cave. Which direction do you want to go?", {:south => :lava, :east => :cavern, :up => :largecave})

my_dungeon.add_room(:lava, "Lava", "suddenly falling down, down, down, down into a scalding hot stream of lava. You are burned to death. The end", {:north => :tinycave})

my_dungeon.add_room(:cavern, "Cavern", "in a cavern full of wonderful rock formations. Stalagmites and stalagtites cover the floor and roof. You wander through in awe. To the east is a passage with a bright glow coming out of it. To the west is a dark, narrow passage. Which way do you want to go?", {:east => :gold, :west => :cavern})

my_dungeon.add_room(:gold, "Golden room", "in a room full of golden treasure. The reflections off the shining metal blind you as you struggle to comprehend how rich you are going to be. You take the treasure, find you way out of the cave system, and live like royalty for the rest of your life. The end.", {:west => :cavern})

#Start game
puts ""
puts "Hello #{my_dungeon.player.name} !"
puts "You wake up one morning inside a large, mysterious cave. Use the terms 'north', 'south', 'east', 'west', 'up' and 'down' to explore your surroundings. Watch out for large cats and lava."
puts ""

my_dungeon.start(:largecave)

#Direction input. Nested until loop runs until user inputs defined directional terms.
loop do
  direction_input = gets.chomp.downcase
  until (direction_input == "north" or direction_input == "south" or direction_input == "east" or direction_input == "west" or direction_input == "up" or direction_input == "down" or direction_input == "exit" )
    puts "Sorry, i don't know that direction. Which direction do you want to go?"
    direction_input = gets.chomp.downcase
  end

  if direction_input == "exit"
    puts "Thanks for playing!"
    exit
  end

  direction = direction_input.to_sym
  my_dungeon.go(direction)
end

#Improvements for next iteration of game:
#Add attributes to rooms and a conditional loop to terminate the game when you reach certain rooms (kingofcats, atrium, lava, campsite, gold)
#Add a conditional loop asking for a correct direction when the user enters a direction option that doesn't exist (eg. asking to go north when you can only go east or west). Currently, the game crashes when this happens.
