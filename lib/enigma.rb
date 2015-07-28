require_relative "./time"
require_relative "./key_generator"
require_relative "./offset_calc"
require_relative "./encrypt"

class Enigma
  def run
    handle = File.open(ARGV[0], "r")
    text_input = handle.read.chomp
    handle.close

    test_encrypt = Encrypt.new
    test_key = Offset.new
    encrypted_message = test_encrypt.encrypt_message(text_input, test_key.offset_calculator)
  end

end





if __FILE__==$0
  test = Enigma.new
  puts test.run
end
