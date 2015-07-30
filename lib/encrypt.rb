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
    string.chars.each do |character|                                                 # => ["8", "p", "c", "1", "n", "n", "l", "6", "n", "h"]
      encrypted_msg << encrypt_character(character, rotation_collection[index % 4])  # => ["t"], ["t", "h"], ["t", "h", "b"], ["t", "h", "b", "."], ["t", "h", "b", ".", "."], ["t", "h", "b", ".", ".", "e"], ["t", "h", "b", ".", ".", "e", "k"], ["t", "h", "b", ".", ".", "e", "k", "d"], ["t", "h", "b", ".", ".", "e", "k", "d", "."], ["t", "h", "b", ".", ".", "e", "k", "d", ".", "."]
      index += 1                                                                     # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    end                                                                              # => ["8", "p", "c", "1", "n", "n", "l", "6", "n", "h"]
    encrypted_msg.join                                                               # => "thb..ekd.."
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)               # => 35, 16, 2, 28, 13, 13, 11, 33, 13, 7
    new_encrypted_char = (pos_of_char + rotation) % keymap.size  # => 20, 7, 1, 38, 38, 4, 10, 3, 38, 38
    keymap[new_encrypted_char]                                   # => "t", "h", "b", ".", ".", "e", "k", "d", ".", "."
  end

end


if __FILE__==$0                                            # => true
  test = Encrypt.new                                       # => #<Encrypt:0x007f84030b70a0 @encrypted_msg=[], @keymap=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]>
  test_key = KeyGenerator.new                              # => #<KeyGenerator:0x007f84030b5958 @random=[1, 2, 5, 5, 4], @rotations={:a=>12, :b=>25, :c=>55, :d=>54}>
  #test.encrypt_message('d2v1l',[-18, -34, -26, -10])
  test.encrypt_message("8pc1nnl6nh",  [-15, -9, -1, -30])  # => "thb..ekd.."
end                                                        # => "thb..ekd.."
