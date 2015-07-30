class KeyGenerator

  attr_accessor :random, :rotations  # => nil

  def initialize(seed = Random.new_seed)
    @random = randomize_5_digits                                # => [8, 3, 3, 1, 2]
    # @random_for_testing = Random.new(seed)
    @rotations = [:a, :b, :c, :d].zip(rotation_collector).to_h  # => {:a=>83, :b=>33, :c=>31, :d=>12}
  end

  def randomize_5_digits
    5.times.map do        # => #<Enumerator: 5:times>
      1 + rand(9)         # => 8, 3, 3, 1, 2
    end                   # => [8, 3, 3, 1, 2]
  end

  # def generate
  #   @key ||= randomize_5_digits
  # end

  def rotation_collector
    rotation_collection =[]                                   # => []
    @random.each_with_index do |num, index|                   # => [8, 3, 3, 1, 2]
      if index <= 3                                           # => true, true, true, true, false
        rotation_collection << [num, random[index + 1]].join  # => ["83"], ["83", "33"], ["83", "33", "31"], ["83", "33", "31", "12"]
      end                                                     # => ["83"], ["83", "33"], ["83", "33", "31"], ["83", "33", "31", "12"], nil
    end                                                       # => [8, 3, 3, 1, 2]
    rotation_collection.map { |index| index.to_i  }           # => [83, 33, 31, 12]
  end

  def ext_rotation_collector(array)
    rotation_collection =[]                                  # => []
    x = array.map.with_index do|num, index|                  # => #<Enumerator: [7, 5, 8, 5, 7]:map>
       if index <= 3                                         # => true, true, true, true, false
        rotation_collection << [num, array[index + 1]].join  # => ["75"], ["75", "58"], ["75", "58", "85"], ["75", "58", "85", "57"]
      end                                                    # => ["75"], ["75", "58"], ["75", "58", "85"], ["75", "58", "85", "57"], nil
    end                                                      # => [["75", "58", "85", "57"], ["75", "58", "85", "57"], ["75", "58", "85", "57"], ["75", "58", "85", "57"], nil]
    rotation_collection.map { |index| index.to_i  }          # => [75, 58, 85, 57]
  end
end


test = KeyGenerator.new                       # => #<KeyGenerator:0x007fc76a82afa8 @random=[8, 3, 3, 1, 2], @rotations={:a=>83, :b=>33, :c=>31, :d=>12}>
test.ext_rotation_collector([7, 5, 8, 5, 7])  # => [75, 58, 85, 57]
