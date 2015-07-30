require_relative './encrypt'
require_relative './key_generator'
require_relative './offset_calc'
class Decrypt

  attr_accessor :input, :key, :date, :decrypted_message

  def initialize(key= ARGV[2])
    get_file
    @key = format_the_key(ARGV[2])
    @date = format_date(ARGV[3].to_i)
    @decrypted_message = decrypted_message
  end

  def get_file #from msg.txt
    incoming_file = File.open(ARGV[0], "r")
    @input = incoming_file.read.chomp
    incoming_file.close
  end

  def write_to_file
    writer = File.open(ARGV[1], "w")
    writer.write(@decrypted_message)
  end

  def format_the_key(key)
    if key.length != 5
      "Please enter a valid key"
    else
      @key = key.chars.map do |i|
        i.to_i
      end
    end
  end

  def turn_key_to_paired_key
    offset_runner = KeyGenerator.new
    @key = offset_runner.ext_rotation_collector(@key)
  end

  def reverse_the_key
    @key = @key.map do |pair|
      pair * -1
    end
  end

  def format_date(date)
    @date = date * date
    @date = date.to_s[-4,4].chars.map { |i| i.to_i }
  end

  def make_final_key
    turn_key_to_paired_key
    offset_runner = Offset.new
    @key = offset_runner.external_offset_calc(key, date)
  end

  def output
    writer = File.open(ARGV[1], "w")
    writer.write(@decrypted_message)
    writer.close
  end

  def decrypt
    encrypt_runner = Encrypt.new
    @decrypted_message = encrypt_runner.encrypt_message(@input, @key)
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
  end

  def final_run
    make_final_key
    decrypt
    output
  end
end

if __FILE__==$0
  decrypt_runner = Decrypt.new([12345])
  decrypt_runner.final_run
end
