require_relative "./key_generator"  # => true

class Encrypt

  attr_accessor :encrypted_msg, :keymap  # => nil

  def initialize
    @encrypted_msg = []                                         # => []
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]
  end        # 0123456789012345678901234567890123456789

  def encrypt_message(string, rotation_collection)
    # string.gsub!(/[^0-9a-z]/, '')                                                    # => "hellomomend"
    index = 0                                                                        # => 0
    string.chars.each do |character|                                                 # => ["x", "5", "7", "3", "o", "z", "0", "5", "t", "z", "u"]
      encrypted_msg << encrypt_character(character, rotation_collection[index % 4])  # => ["h"], ["h", "e"], ["h", "e", "l"], ["h", "e", "l", "l"], ["h", "e", "l", "l", "."], ["h", "e", "l", "l", ".", "."], ["h", "e", "l", "l", ".", ".", "e"], ["h", "e", "l", "l", ".", ".", "e", "n"], ["h", "e", "l", "l", ".", ".", "e", "n", "d"], ["h", "e", "l", "l", ".", ".", "e", "n", "d", "."], ["h", "e", "l", "l", ".", ".", "e", "n", "d", ".", "."]
      index += 1                                                                     # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    end                                                                              # => ["x", "5", "7", "3", "o", "z", "0", "5", "t", "z", "u"]
    encrypted_msg.join                                                               # => "hell..end.."
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)               # => 24, 32, 34, 30, 15, 26, 27, 32, 20, 26, 21
    new_encrypted_char = (pos_of_char + rotation) % keymap.size  # => 7, 4, 11, 11, 38, 38, 4, 13, 3, 38, 38
    keymap[new_encrypted_char]                                   # => "h", "e", "l", "l", ".", ".", "e", "n", "d", ".", "."
  end

end


if __FILE__==$0                                               # => true
  test = Encrypt.new                                          # => #<Encrypt:0x007fc44c09bda8 @encrypted_msg=[], @keymap=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]>
  test_key = KeyGenerator.new                                 # => #<KeyGenerator:0x007fc44c09a610 @random=[7, 2, 8, 3, 4], @rotations={:a=>72, :b=>28, :c=>83, :d=>34}>
  #test.encrypt_message('d2v1l',[-18, -34, -26, -10])
  test.encrypt_message("x573oz05tzu",  [-17, -28, -23, -19])  # => "hell..end.."
end                                                           # => "hell..end.."
