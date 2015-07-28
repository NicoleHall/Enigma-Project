require_relative "./time"
require_relative "./key_generator"
require_relative "./offset_calc"
require_relative "./encrypt"

#File IO opens the handle which stores message.txt
#==================================================
#send message to encryptor class  whicc does *lots of work* and RETURNS and encrypted msg
#==================================================
#take nonsense string...FILE IO to the ARGV[1]

class Enigma

  def read_file
    "He made butter"
  end

  # def make_total_key
  #   n = Offset.new
  #   n.offset_calculator
  # end

  def send_to_encrypt
    test_encrypt = Encrypt.new
    test_encrypt.encrypt_message(read_file)
  end

end

test = Enigma.new
test.send_to_encrypt

# puts "Created #{ARGV[0]} with the key #{n.randomize_5_digits} and date #{x.formatted_time} "
