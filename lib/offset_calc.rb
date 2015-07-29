require_relative "./time"           # => true
require_relative "./key_generator"  # => true

class Offset

  attr_accessor :key, :time  # => nil

  def initialize
    @time = retrieve_time    # => 290715
    @key = KeyGenerator.new  # => #<KeyGenerator:0x007fb5b386b238 @random=[1, 7, 5, 4, 6], @rotations={:a=>17, :b=>75, :c=>54, :d=>46}>
  end

  def retrieve_time
    time_actual = Time.new      # => 2015-07-29 12:30:09 -0600
    time_actual.formatted_time  # => 290715
  end

  def format_time_offsets
    time = retrieve_time
    time *= time
    time_digits = time.to_s[-4, 4].chars
  end

  def get_key
    key.rotation_collector
  end

  def offset_calculator
    pre_key = get_key.zip(format_time_offsets)
    pre_key.map do |pair|
      pair.map(&:to_i).reduce(:+)
    end
  end

  def external_offset_calc(ext_key, ext_date)
    pre_key = ext_key.zip(ext_date)            # => [[12345, 280715]]
      pre_key.map do |pair|                    # => [[12345, 280715]]
        pair.map(&:to_i).reduce(:+) * -1       # => -293060
    end                                        # => [-293060]
  end

end

test_runner = Offset.new                             # => #<Offset:0x007fb5b386b648 @time=290715, @key=#<KeyGenerator:0x007fb5b386b238 @random=[1, 7, 5, 4, 6], @rotations={:a=>17, :b=>75, :c=>54, :d=>46}>>
test_runner.external_offset_calc([12345],[280715] )  # => [-293060]
