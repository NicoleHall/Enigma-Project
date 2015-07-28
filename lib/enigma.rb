require_relative "./time"
require_relative "./key_generator"
require_relative "./offset_calc"
require_relative "./encrypt"

class Enigma

  attr_accessor :encrypted_message, :input

  def initialize
    @input = input
    @encrypted_message = encrypted_message
  end

  def get_key
    key = KeyGenerator.new
    key.randomize_5_digits.join
  end

  def get_file
    handle = File.open(ARGV[0], "r")
    @input = handle.read.chomp
    handle.close
  end

  def run_encrypt
    encrypt_runner = Encrypt.new
    key_runner = Offset.new
    @encrypted_message = encrypt_runner.encrypt_message(@input, key_runner.offset_calculator)
    puts "Created '#{ARGV[1]}' with the key #{get_key} and date #{key_runner.time}."
  end

  def output
    writer = File.open(ARGV[1], "w")
    writer.write(@encrypted_message)
  end

end


if __FILE__==$0
  test = Enigma.new
  test.get_key
  test.get_file
  test.run_encrypt
  test.output
end
