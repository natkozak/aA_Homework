# PHASE 2
def convert_to_int(str)
  Integer(str)

rescue
  puts "Please use numbers, not letters."
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end

  
end

def coffee_reaction(maybe_coffee)
  if "coffee" == maybe_coffee
    puts "HIHIHI YES Thanks for the coffee!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  else
    raise "You tried. You failed. No more friendship for you."
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"

  #exception attempt; not working
  begin
  maybe_fruit = gets.chomp
  return reaction(maybe_fruit)
  unless hate.nil?
    return coffee_reaction(maybe_fruit)
  end
  rescue StandardError => e
    hate = true
    puts "ZOMG NO!!! You needed to give me a fruit! I only want coffee now."
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
    raise "no, that's not a pasttime!!" if @fav_pasttime == nil
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


