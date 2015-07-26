require_relative "./time"
require_relative "./key_generator"
require_relative "./offset_calc"

#File IO opens the handle which stores message.txt
#======
#send message to encryptor class  whicc does *lots of work* and RETURNS and encrypted msg
#======
#take nonsense string...FILE IO to the ARGV[1]

class Enigma

  def read
    handle = File.open(ARGV[0], "r")
  end

  def send_to_encrypt
  end

  def writes

  end

n=KeyGenerator.new
x=Time.new
puts "Created #{ARGV[0]} with the key #{n.randomize_5_digits} and date #{x.formatted_time} "
