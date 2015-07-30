require_relative './encrypt'  # => true

class Crack

  attr_accessor :input, :final_key, :cracked_message  # => nil

  def initialize(input = get_file)
    @input = input                                                      # => "ucuuvhuo"
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars.reverse  # => [" ", ".", ",", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "l", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    @template = "nd.."                                                  # => "nd.."
    @rotation_offset = 0                                                # => 0
    @final_key = final_key                                              # => nil
    @cracked_message = cracked_message                                  # => nil
  end

  def get_file
    incoming_file = File.open(ARGV[0], "r")
    @input = incoming_file.read.chomp
    incoming_file.close
    # require "pry";binding.pry
  end

  def last_four
    last_four = @input[-4, 4].chars  # => ["v", "h", "u", "o"], ["v", "h", "u", "o"]
  end

  def set_rotation_offset

    @rotation_offset = @input.size % 4  # => 0
    if @rotation_offset == 1            # => false
      @rotation_offset = 3
    elsif @rotation_offset == 3         # => false
      @rotation_offset = 1
    end                                 # => nil
  end

  def set_pairs
    @template = @template.chars         # => ["n", "d", ".", "."]
    @paired = last_four.zip(@template)  # => [["v", "n"], ["h", "d"], ["u", "."], ["o", "."]]

  end

  def find_rotation_distance
    @final_key = @paired.map do |pair|       # => [["v", "n"], ["h", "d"], ["u", "."], ["o", "."]]
      start = @keymap.index(pair.first)      # => 17, 32, 18, 24
      ending = @keymap.index(pair.last)      # => 26, 36, 1, 1
      if start > ending                      # => false, false, true, true
        -(@keymap.size - (start - ending ))  # => 23, 17
      else
       -(ending - start)                     # => -9, -4
      end                                    # => -9, -4, -23, -17
    end                                      # => [-9, -4, -23, -17]
    @final_key.rotate(@rotation_offset)      # => [-9, -4, -23, -17]
  end




  def send_to_encrypt_class
    encrypt_runner = Encrypt.new                                           # => #<Encrypt:0x007f80f508ff70 @encrypted_msg=[], @keymap=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]>
    @cracked_message = encrypt_runner.encrypt_message(@input, @final_key)  # => "m..end.."
  end

  def write_file
    writer = File.open(ARGV[1], "w")  # ~> TypeError: no implicit conversion of nil into String
    writer.write(@cracked_message)
    writer.close
  end
end


if __FILE__==$0                         # => true
  crack_runner = Crack.new("ucuuvhuo")  # => #<Crack:0x007f80f509c428 @input="ucuuvhuo", @keymap=[" ", ".", ",", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "l", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"], @template="nd..", @rotation_offset=0, @final_key=nil, @cracked_message=nil>
  crack_runner.last_four                # => ["v", "h", "u", "o"]
  # crack_runner.get_file
  crack_runner.set_rotation_offset      # => nil
  crack_runner.set_pairs                # => [["v", "n"], ["h", "d"], ["u", "."], ["o", "."]]
  crack_runner.find_rotation_distance   # => [-9, -4, -23, -17]
  # crack_runner.shift_key_to_ABCD_order                   # => [-16, -15, -36, -6]
  crack_runner.send_to_encrypt_class    # => "m..end.."
  crack_runner.write_file
end

# ~> TypeError
# ~> no implicit conversion of nil into String
# ~>
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/crack.rb:65:in `initialize'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/crack.rb:65:in `open'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/crack.rb:65:in `write_file'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/lib/crack.rb:81:in `<main>'
