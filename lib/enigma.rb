require_relative "./time"           # => true
require_relative "./key_generator"  # => true
require_relative "./offset_calc"    # => true
require_relative "./encrypt"        # => true

#File IO opens the handle which stores message.txt
#==================================================
#send message to encryptor class  whicc does *lots of work* and RETURNS and encrypted msg
#==================================================
#take nonsense string...FILE IO to the ARGV[1]

class Enigma

  def read_file
    "He made butter"  # => "He made butter"
  end

  def send_to_encrypt
    test_encrypt = Encrypt.new                                            # => #<Encrypt:0x007f860a108c30 @rotation_collection=[77, 78, 86, 66], @encrypted_msg=[], @keymap=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "l", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", " "]>
    test_key = KeyGenerator.new                                           # => #<KeyGenerator:0x007f860b887078 @random=[2, 2, 8, 4, 3], @rotations={:a=>22, :b=>28, :c=>84, :d=>43}>
    test_encrypt.encrypt_message(read_file, test_key.rotation_collector)  # => "25dov4icwjxwzg"
  end




end

test = Enigma.new     # => #<Enigma:0x007f860a108d48>
test.send_to_encrypt  # => "25dov4icwjxwzg"
