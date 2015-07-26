class KeyGenerator

  attr_accessor :random, :rotation_collection

  def initialize
    @random = randomize_5_digits
    @rotation_collection = []
  end

  def randomize_5_digits
    5.times.map do
      1 + rand(9)
    end.join
  end

  def rotation_a
    random[0..1]
  end

  def rotation_b
    random[1..2]
  end

  def rotation_c
    random[2..3]
  end

  def rotation_d
    random[3..4]
  end

  def rotation_collector
    rotation_collection << rotation_a
    rotation_collection << rotation_b
    rotation_collection << rotation_c
    rotation_collection << rotation_d
  end
end

if __FILE__==$0
  n = KeyGenerator.new
  n.rotation_collector
end
