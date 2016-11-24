# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
#  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish
# lengths to all other fish lengths

# fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish',
#         'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  longest_fish = ""
  total_indices = fish.size - 1

  (0...total_indices).each do |i|
    ((i + 1)..total_indices).each do |j|
      longest = [longest_fish, fish[i], fish[j]].max_by(&:length)
    end
  end

  longest_fish
end

# Dominant Octopus

# Find the longest fish in O(n log n) time. Remember that Big O is
# classified by the dominant term.

def dominant_octopus(fish)
  return fish if fish.size <= 1

  pivot = fish.first
  left = fish.drop(1).select { |el| el.size < pivot.size }
  right = fish.drop(1).select { |el| el.size > pivot.size }

  dominant_octopus(left) + [pivot] + dominant_octopus(right)
end

def nlogn_biggest_fish(fish)
  dominant_octopus(fish).last
end

# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the
# array only once.

def clever_octopus(fish)
  longest_fish = ""

  fish.each { |fish| longest_fish = fish if fish.size > longest_fish.size }

  longest_fish
end

# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution.
# The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down",
#                "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding
# tentacle. We can assume that the octopus's eight tentacles are numbered
# and correspond to the tile direction indices.

# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return the
# tentacle number (tile index) the octopus must move. This should take
# O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == direction }
end

# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that you can
# access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
