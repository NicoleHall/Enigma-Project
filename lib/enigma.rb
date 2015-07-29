require_relative "./time"           # => true
require_relative "./key_generator"  # => true
require_relative "./offset_calc"    # => true
require_relative "./encrypt"        # => true

class Enigma

  attr_accessor :encrypted_message, :input  # => nil

  def initialize
    @input = input                          # => nil
    @encrypted_message = encrypted_message  # => nil
  end

  def get_key
    offset_runner = Offset.new         # => #<Offset:0x007ff06b878b98 @time=290715, @key=#<KeyGenerator:0x007ff06b878a08 @random=[6, 3, 1, 5, 2], @rotations={:a=>63, :b=>31, :c=>15, :d=>52}>>
    formatted = offset_runner.get_key  # => [63, 31, 15, 52]

  end

  def get_file
    handle = File.open(ARGV[0], "r")  # ~> TypeError: no implicit conversion of nil into String
    @input = handle.read.chomp
    handle.close
  end

  def run_encrypt
    encrypt_runner = Encrypt.new
    offset_runner = Offset.new
    @encrypted_message = encrypt_runner.encrypt_message(@input, offset_runner.offset_calculator)
    puts "Created '#{ARGV[1]}' with the key #{offset_runner.get_key} and date #{offset_runner.time}. #{offset_runner.offset_calculator}"
  end

  def output
    writer = File.open(ARGV[1], "w")
    writer.write(@encrypted_message)
  end

end


if __FILE__==$0      # => true
  test = Enigma.new  # => #<Enigma:0x007ff06b878f08 @input=nil, @encrypted_message=nil>
  test.get_key       # => [63, 31, 15, 52]
  test.get_file
  test.run_encrypt
  test.output
end

# ~> TypeError
# ~> no implicit conversion of nil into String
# ~>
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/enigma.rb:22:in `initialize'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/enigma.rb:22:in `open'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/enigma.rb:22:in `get_file'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/enigma.rb:45:in `<main>'
