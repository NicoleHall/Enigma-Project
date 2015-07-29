require_relative './encrypt'        # => true
require_relative './key_generator'  # => false
require_relative './offset_calc'    # => true
class Decrypt

  attr_accessor :input, :key, :date, :decrypted_message  # => nil

  def initialize(key= ARGV[2])
    @input = input                          # => nil
    @key = key                              # => [12345]
    @date = date                            # => nil
    @decrypted_message = decrypted_message  # => nil
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
    @key = ARGV[2]  # => nil
  end

  def format_the_key
    if @key.length != 5  # ~> NoMethodError: undefined method `length' for nil:NilClass
      "Please enter a valid key"
    else
      @key = @key.chars.map do |i|
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

  def output
    writer = File.open(ARGV[1], "w")
    writer.write(@decrypted_message)
  end

  def decrypt
    encrypt_runner = Encrypt.new
    @decrypted_message = encrypt_runner.encrypt_message(@input, @key)
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
  end

  def summary
    p @input
    p @decrypted_message
  end

end


if __FILE__==$0                           # => true
  decrypt_runner = Decrypt.new([12345])   # => #<Decrypt:0x007fc351839778 @input=nil, @key=[12345], @date=nil, @decrypted_message=nil>
  # decrypt_runner.get_file
 decrypt_runner.get_key                   # => nil
p decrypt_runner.format_the_key
p  decrypt_runner.turn_key_to_paired_key
  decrypt_runner.get_date
  decrypt_runner.format_date
  # decrypt_runner.make_final_key
  # decrypt_runner.decrypt
  # decrypt_runner.output
end

# ~> NoMethodError
# ~> undefined method `length' for nil:NilClass
# ~>
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/decrypt.rb:31:in `format_the_key'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/decrypt.rb:88:in `<main>'
