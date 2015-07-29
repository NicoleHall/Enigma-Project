require_relative './encrypt'
require_relative './key_generator'
require_relative './offset_calc'
class Decrypt

  attr_reader :input, :key, :date, :decrypted_message

  def initialize
    @input = input
    @key = key
    @date = date
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

  def get_key
    @key = ARGV[2]
  end

  def format_the_key
    @key = @key.chars.map do |i|
      i.to_i
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

  def get_date
    @date = ARGV[3].to_i
  end

  def format_date
    @date = @date * @date
    @date = @date.to_s[-4,4].chars.map { |i| i.to_i }
  end

  def make_final_key
    offset_runner = Offset.new
    @key = offset_runner.external_offset_calc(@key, @date)
  end

  def decrypt
    encrypt_runner = Encrypt.new
    p @input ;p @key
    encrypt_runner.encrypt_message(@input, @key)
  end

  
end




decrypt_runner = Decrypt.new
decrypt_runner.get_file
decrypt_runner.get_key
decrypt_runner.format_the_key
decrypt_runner.turn_key_to_paired_key
decrypt_runner.get_date
decrypt_runner.format_date
decrypt_runner.make_final_key
p decrypt_runner.decrypt
