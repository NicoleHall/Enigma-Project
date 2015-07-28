class KeyGenerator

  attr_accessor :random, :rotations

  def initialize
    # @random = randomize_5_digits  # => "12345"
    @random = randomize_5_digits                               # => [7, 7, 2, 1, 4]
    @rotations = [:a, :b, :c, :d].zip(rotation_collector).to_h  # => {:a=>"77", :b=>"72", :c=>"21", :d=>"14"}
  end

  def randomize_5_digits
    5.times.map do        # => #<Enumerator: 5:times>
      1 + rand(9)         # => 7, 7, 2, 1, 4
    end                   # => [7, 7, 2, 1, 4]
  end



  def rotation_collector
    rotation_collection =[]                                   # => [], []
    @random.each_with_index do |num, index|                   # => [7, 7, 2, 1, 4], [7, 7, 2, 1, 4]
      if index <= 3                                           # => true, true, true, true, false, true, true, true, true, false
        rotation_collection << [num, random[index + 1]].join  # => ["77"], ["77", "72"], ["77", "72", "21"], ["77", "72", "21", "14"], ["77"], ["77", "72"], ["77", "72", "21"], ["77", "72", "21", "14"]
      end                                                     # => ["77"], ["77", "72"], ["77", "72", "21"], ["77", "72", "21", "14"], nil, ["77"], ["77", "72"], ["77", "72", "21"], ["77", "72", "21", "14"], nil
    end                                                       # => [7, 7, 2, 1, 4], [7, 7, 2, 1, 4]
    rotation_collection                                       # => ["77", "72", "21", "14"], ["77", "72", "21", "14"]
  end
end


if __FILE__==$0         # => true
  n = KeyGenerator.new  # => #<KeyGenerator:0x007f9ef28a1680 @random=[7, 7, 2, 1, 4], @rotaions={:a=>"77", :b=>"72", :c=>"21", :d=>"14"}>
  n.rotation_collector  # => ["77", "72", "21", "14"]
end                     # => ["77", "72", "21", "14"]








# def rotation_a
#   random[0..1]  # => "51"
# end
#
# def rotation_b
#   random[1..2]  # => "17"
# end
#
# def rotation_c
#   random[2..3]  # => "79"
# end
#
# def rotation_d
#   random[3..4]  # => "99"
# end
