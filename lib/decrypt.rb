

class Decrypt

  attr_accessor :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  # def convert_key_and_date(key, date)
  #   external_offset_calc(key, date)
  # end

  def send_to_terminal
    puts "#{message} : #{key} : #{date}"
  end

end

test_decrypt = Decrypt.new(ARGV[0],ARGV[1],ARGV[2])
test_decrypt.send_to_terminal
p test_decrypt.convert_key_and_date([1,2,3,4,5], 270715)
