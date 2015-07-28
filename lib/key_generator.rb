class KeyGenerator

  attr_accessor :random, :rotations

  def initialize
    # @random = randomize_5_digits  # => "12345"
    @random = randomize_5_digits
    @rotations = [:a, :b, :c, :d].zip(rotation_collector).to_h
  end

  def randomize_5_digits
    5.times.map do
      1 + rand(9)
    end
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

if __FILE__==$0
  n = KeyGenerator.new
  n.rotation_collector
end
