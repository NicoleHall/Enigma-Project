require_relative "./time"           # => true
require_relative "./key_generator"  # => true

class Offset

  attr_accessor :key, :time  # => nil

  def initialize
    @time = retrieve_time    # => 280715
    @key = KeyGenerator.new  # => #<KeyGenerator:0x007fb884126b48 @random=[1, 3, 2, 4, 7], @rotations={:a=>13, :b=>32, :c=>24, :d=>47}>
  end

  def retrieve_time
    time_actual = Time.new      # => 2015-07-28 10:31:23 -0600, 2015-07-28 10:31:23 -0600
    time_actual.formatted_time  # => 280715, 280715
  end

  def format_time_offsets
    time = retrieve_time                  # => 280715
    time *= time                          # => 78800911225
    time_digits = time.to_s[-4, 4].chars  # => ["1", "2", "2", "5"]
  end

  def get_key
    key.rotation_collector  # => [13, 32, 24, 47]
  end

  def offset_calculator
    pre_key = get_key.zip(format_time_offsets)  # => [[13, "1"], [32, "2"], [24, "2"], [47, "5"]]
    pre_key.map do |pair|                       # => [[13, "1"], [32, "2"], [24, "2"], [47, "5"]]
      pair.map(&:to_i).reduce(:+)               # => 14, 34, 26, 52
    end                                         # => [14, 34, 26, 52]
  end

  def external_offset_calc(ext_key, ext_date)
    pre_key = ext_key.zip(ext_date)            # => [[1, "1"], [2, "2"], [3, "3"], [4, "4"], [5, nil]]
      pre_key.map do |pair|                    # => [[1, "1"], [2, "2"], [3, "3"], [4, "4"], [5, nil]]
        pair.map(&:to_i).reduce(:+)            # => 2, 4, 6, 8, 5
    end                                        # => [2, 4, 6, 8, 5]
  end

end


if __FILE__==$0                                           # => true
  n = Offset.new                                          # => #<Offset:0x007fb884126f58 @time=280715, @key=#<KeyGenerator:0x007fb884126b48 @random=[1, 3, 2, 4, 7], @rotations={:a=>13, :b=>32, :c=>24, :d=>47}>>
  n.offset_calculator                                     # => [14, 34, 26, 52]
end                                                       # => [2, 4, 6, 8, 5]
