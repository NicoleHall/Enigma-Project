class KeyGenerator

  attr_accessor :random, :rotations

  def initialize(seed = Random.new_seed)
    @random = randomize_5_digits  # => "12345"
    # @random_for_testing = Random.new(seed)
    @rotations = [:a, :b, :c, :d].zip(rotation_collector).to_h
  end

  def randomize_5_digits
    5.times.map do
      1 + rand(9)
    end
  end

  def generate
    @key ||= randomize_5_digits
  end

  def rotation_collector
    rotation_collection =[]
    @random.each_with_index do |num, index|
      if index <= 3
        rotation_collection << [num, random[index + 1]].join
      end
    end
    rotation_collection.map { |index| index.to_i  }
  end
end

# if __FILE__==$0         # => true
#   n = KeyGenerator.new  # => #<KeyGenerator:0x007fd989820180 @random=[2, 5, 5, 5, 5], @rotations={:a=>25, :b=>55, :c=>55, :d=>55}>
#   n.rotation_collector  # => [25, 55, 55, 55]
# end                     # => [25, 55, 55, 55]
