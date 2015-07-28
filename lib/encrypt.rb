

class Encrypt

  def encrypt_message
    rotation_collection = [14, 41, 100, 91]
    encrypted_msg = []
    index = 0
    "ducksssssssss".chars.each do |char|
      encrypted_msg << encrypt_character(char, rotation_collection[index%4])
      index += 1
    end
    encrypted_msg
  end

  def encrypt_character(character, rotation)
    keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars
    x = keymap.index(character)
    encrypted_char = (x + rotation) % keymap.size
    keymap[encrypted_char]
  end
end

test = Encrypt.new
test.encrypt_message
