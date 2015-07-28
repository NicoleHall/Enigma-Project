require_relative "./key_generator"  # => true

class Encrypt

  attr_accessor :encrypted_msg, :keymap  # => nil

  def initialize
    n = KeyGenerator.new                                        # => #<KeyGenerator:0x007fd7a48a4980 @random=[6, 8, 8, 6, 7], @rotations={:a=>68, :b=>88, :c=>86, :d=>67}>
    @rotation_collection = n.rotation_collector                 # => [68, 88, 86, 67]
    @encrypted_msg = []                                         # => []
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]
  end

  def encrypt_message(string)
    index = 0                                                                         # => 0
    string.chars.each do |character|                                                  # => ["I", " ", "a", "m", " ", "a", " ", "N", "a", "z", "i", ".", " ", "L", "e", "t", "s", " ", "a", "t", "t", "a", "c", "k", " ", "P", "o", "l", "a", "n", "d", " ", "t", "m", "r", "w", ".", " ", "k", "t", "h", "x", " ", "b", "a", "i"]
      encrypted_msg << encrypt_character(character, @rotation_collection[index % 4])  # => ["9"], ["9", "h"], ["9", "h", "g"], ["9", "h", "g", " "], ["9", "h", "g", " ", "0"], ["9", "h", "g", " ", "0", "i"], ["9", "h", "g", " ", "0", "i", "f"], ["9", "h", "g", " ", "0", "i", "f", "a"], ["9", "h", "g", " ", "0", "i", "f", "a", "1"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0", "s"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0", "s", "k"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0", "s", "k", "h"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0", "s", "k", "h", "h"], ["9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0", "s", "k", "h", "h", "h"], ["9", "h", "g",...
      index += 1                                                                      # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46
    end                                                                               # => ["I", " ", "a", "m", " ", "a", " ", "N", "a", "z", "i", ".", " ", "L", "e", "t", "s", " ", "a", "t", "t", "a", "c", "k", " ", "P", "o", "l", "a", "n", "d", " ", "t", "m", "r", "w", ".", " ", "k", "t", "h", "x", " ", "b", "a", "i"]
    encrypted_msg.join                                                                # => "9hg 0ifa17ly0skhhhghiii,0xu.1ujzitxkzhph85f11p"
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)               # => 8, 39, 0, 12, 39, 0, 39, 13, 0, 26, 8, 38, 39, 11, 4, 20, 19, 39, 0, 20, 20, 0, 2, 10, 39, 16, 15, 11, 0, 13, 3, 39, 20, 12, 18, 23, 38, 39, 10, 20, 7, 24, 39, 1, 0, 8
    new_encrypted_char = (pos_of_char + rotation) % keymap.size  # => 36, 7, 6, 39, 27, 8, 5, 0, 28, 34, 14, 25, 27, 19, 10, 7, 7, 7, 6, 7, 8, 8, 8, 37, 27, 24, 21, 38, 28, 21, 9, 26, 8, 20, 24, 10, 26, 7, 16, 7, 35, 32, 5, 28, 28, 16
    keymap[new_encrypted_char]                                   # => "9", "h", "g", " ", "0", "i", "f", "a", "1", "7", "l", "y", "0", "s", "k", "h", "h", "h", "g", "h", "i", "i", "i", ",", "0", "x", "u", ".", "1", "u", "j", "z", "i", "t", "x", "k", "z", "h", "p", "h", "8", "5", "f", "1", "1", "p"
  end
end

if __FILE__==$0                                                           # => true
  test = Encrypt.new                                                      # => #<Encrypt:0x007fd7a48a49a8 @rotation_collection=[68, 88, 86, 67], @encrypted_msg=[], @keymap=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]>
  test.encrypt_message("I am a Nazi. Lets attack Poland tmrw. kthx bai")  # => "9hg 0ifa17ly0skhhhghiii,0xu.1ujzitxkzhph85f11p"
end                                                                       # => "9hg 0ifa17ly0skhhhghiii,0xu.1ujzitxkzhph85f11p"
