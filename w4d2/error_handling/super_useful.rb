class CoffeeError < StandardError
  def message 
    "No give me coffee now"
  end
end

class FruitError < StandardError

  
  def message 
    "ZOMG NO!!! You needed to give me a fruit! But you gave me coffee so I'll give you one more try."
  end
end

# PHASE 2
def convert_to_int(str)
  Integer(str)

rescue ArgumentError
  puts "Please use numbers, not letters."
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    puts "HIHIHI YES Thanks for the coffee!!!!!!!!!!!!!"
    raise FruitError
  else
    raise "You tried. You failed. No more friendship for you."
  end
  
end

def coffee_reaction(maybe_coffee)
  if "coffee" == maybe_coffee
    
  else
    
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"

  #exception attempt; not working
  begin
  maybe_fruit = gets.chomp #endless loop if this line is above "begin"
  return reaction(maybe_fruit)
  #return coffee_reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
  rescue FruitError => e
    puts e.message
    retry
  end
  
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    
    @fav_pastime = fav_pastime
    raise "Not enough time boyo" if @yrs_known < 5
    raise "name yourself" if @name == nil
    raise "no, that's not a pasttime!!" if @fav_pastime.nil?
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


