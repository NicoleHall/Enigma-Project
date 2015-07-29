require_relative "./key_generator"

class Encrypt

  attr_accessor :encrypted_msg, :keymap

  def initialize
    @encrypted_msg = []
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars
  end

  def encrypt_message(string, rotation_collection)
    index = 0
    string.chars.each do |character|
      encrypted_msg << encrypt_character(character, rotation_collection[index % 4])
      index += 1
    end
    encrypted_msg.join
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)
    new_encrypted_char = (pos_of_char + rotation) % keymap.size
    keymap[new_encrypted_char]
  end

end


if __FILE__==$0
  test = Encrypt.new
  test_key = KeyGenerator.new
  #test.encrypt_message('d2v1l',[-77, -67, -53, -22])
  test.encrypt_message("hello", [93,31,96,52])
end
