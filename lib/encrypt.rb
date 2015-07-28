require_relative "./key_generator"  # => true

class Encrypt

  attr_accessor :encrypted_msg, :keymap  # => nil

  def initialize
    n = KeyGenerator.new                                        # => #<KeyGenerator:0x007f90c3841a38 @random=[5, 6, 5, 5, 1], @rotations={:a=>56, :b=>65, :c=>55, :d=>51}>
    @rotation_collection = n.rotation_collector                 # => [56, 65, 55, 51]
    @encrypted_msg = []                                         # => []
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]
  end

  def encrypt_message(string)
    index = 0                                                                         # => 0
    string.chars.each do |character|                                                  # => ["d", "u", "c", "n", "i", "j", "f", "s", "n", "o", "a"]
      encrypted_msg << encrypt_character(character, @rotation_collection[index % 4])  # => ["s"], ["s", "g"], ["s", "g", "q"], ["s", "g", "q", "x"], ["s", "g", "q", "x", "x"], ["s", "g", "q", "x", "x", "7"], ["s", "g", "q", "x", "x", "7", "t"], ["s", "g", "q", "x", "x", "7", "t", "3"], ["s", "g", "q", "x", "x", "7", "t", "3", "2"], ["s", "g", "q", "x", "x", "7", "t", "3", "2", "a"], ["s", "g", "q", "x", "x", "7", "t", "3", "2", "a", "o"]
      index += 1                                                                      # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    end                                                                               # => ["d", "u", "c", "n", "i", "j", "f", "s", "n", "o", "a"]
    encrypted_msg                                                                     # => ["s", "g", "q", "x", "x", "7", "t", "3", "2", "a", "o"]
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)               # => 3, 21, 2, 13, 8, 9, 5, 19, 13, 15, 0
    new_encrypted_char = (pos_of_char + rotation) % keymap.size  # => 19, 6, 17, 24, 24, 34, 20, 30, 29, 0, 15
    keymap[new_encrypted_char]                                   # => "s", "g", "q", "x", "x", "7", "t", "3", "2", "a", "o"
  end

end

if __FILE__==$0                        # => true
  test = Encrypt.new                   # => #<Encrypt:0x007f90c3841a60 @rotation_collection=[56, 65, 55, 51], @encrypted_msg=[], @keymap=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]>
  test.encrypt_message("ducnijfsnoa")  # => ["s", "g", "q", "x", "x", "7", "t", "3", "2", "a", "o"]
end                                    # => ["s", "g", "q", "x", "x", "7", "t", "3", "2", "a", "o"]
