require_relative "./time"
require_relative "./key_generator"

class Offset

  attr_accessor :key, :time

  def initialize
    @time = retrieve_time
    @key = KeyGenerator.new
  end

  def retrieve_time
    time_actual = Time.new
    time_actual.formatted_time
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
end

end

if __FILE__==$0
  n = Offset.new
  n.offset_calculator
end
