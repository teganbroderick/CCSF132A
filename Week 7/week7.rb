#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190317
# FILE: week7.rb
# DESC: Week 7 Exercise: Creating a Ruby Pet Class

#Pet parent class
class Pet
  def initialize(name)
    @name = name
  end

  def speak
    puts "Hi! I am a #{self.class}. My name is #{@name}!"
  end
end

#Dog child class
class Dog < Pet
  def initialize(name, color, sound, address)
    super(name)
    @color = color
    @sound = sound
    @address = address
  end

  def speak
    super
    puts "#{@sound}"
    puts "I am a beautiful shade of #{@color}."
    puts "I live #{@address}."
  end

end

#Cat child class
class Cat < Pet
  def initialize(name, color, sound, address)
    super(name)
    @color = color
    @sound = sound
    @address = address
  end

  def speak
    super
    puts "#{@sound}"
    puts "I am a beautiful shade of #{@color}."
    puts "I live #{@address}."
  end
end

#Horse child class
class Horse < Pet
def initialize(name, color, sound, address)
    super(name)
    @color = color
    @sound = sound
    @address = address
  end

  def speak
    super
    puts "#{@sound}"
    puts "I am a beautiful shade of #{@color}."
    puts "I live #{@address}."
  end
end

#Instances and Output
buster = Dog.new('Buster', 'golden brown',
  'Woof! Woof!', 'at the house where my food dish is')
puts buster.speak

marshmallow = Cat.new("Marshmallow", "tabby furriness", "Meow!", "in a castle")
puts marshmallow.speak

harold = Horse.new("Harold", "shiny white", "Neigh!", "at a stable in the rolling hills of Point Reyes")
puts harold.speak

finnegan = Dog.new("Finnegan", "grey, black and white", "Ruff, ruff!", "in Alamo Square")
puts finnegan.speak

sox = Cat.new("Sox", "orange with white feet", "Mew!", "at a cottage at the end of a mountain road")
puts sox.speak

astroboy = Horse.new("Astroboy", "every color of the rainbow", "Neigh!", "in the wilderness, wild and free")
puts astroboy.speak

mr_sausage = Dog.new("Mr Sausage", "black and white with spots", "Bark!", "in a sausage dog shaped wagon")
puts mr_sausage.speak

super_burrito = Cat.new("Super Burrito", "fluffy white", "Meow meow meow!", "at a house in Sydney, Australia")
puts super_burrito.speak

white_lightning = Horse.new("White Lightning", "deep brown", "Neigh!", "in a fancy stable")
puts white_lightning.speak
