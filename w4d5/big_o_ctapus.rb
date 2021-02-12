

def sluggish_octo(fish)
  max = 0
  (0...fish.length).each do |i|
    (0...fish.length).each do |j|
      max_maybe = [max[i], max[j]].max
      if max_maybe > max
        max = max_maybe
      end
    end
  end
  max
end

def dominant_octopus(fish)
  fish.max #iirc this implements binary search
end

def clever_octopus(fish)
  max = 0
  (0...fish.length).each do |i|
    if fish[i].length > max
      max = fish[i].length
    end
  end
  max
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

sluggish_octo(fish)




def slow_dance(target, tiles_array)
  #iterate through the array
  tiles_array.each.with_index do |ele, i|
    return i if ele == target
  end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

slow_dance("up", tiles_array)
# 0

slow_dance("right-down", tiles_array)
# 3

tiles_hash = {
  "up" => 0, 
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5
  "left" => 6
  "left-up" => 7
}

def fast_dance(target, tiles_hash)
  return tiles_hash[target]
end

fast_dance("up", new_tiles_data_structure)
# 0

fast_dance("right-down", new_tiles_data_structure)
# 3

