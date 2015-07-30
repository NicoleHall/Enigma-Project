class Crack

  template = "nd.."                  # => "nd.."
  encrypted_message = "x573oz05tzu"  # => "x573oz05tzu"

  keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars.reverse  # => [" ", ".", ",", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "l", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]

  last_four = encrypted_message[-4,4].chars     # => ["5", "t", "z", "u"]
  rotation_offset = encrypted_message.size % 4  # => 3
  if rotation_offset == 1                       # => false
    rotation_offset = 3
  elsif rotation_offset == 3                    # => true
    rotation_offset = 1                         # => 1
  end                                           # => 1

rotation_offset                     # => 1
  # isolate the last 4
  template = template.chars         # => ["n", "d", ".", "."]
  # split the last 4 figures
  # pair with corresponding values
  paired = last_four.zip(template)  # => [["5", "n"], ["t", "d"], ["z", "."], ["u", "."]]
  # find the difference of each pair
  the_one = paired.map do |pair|    # => [["5", "n"], ["t", "d"], ["z", "."], ["u", "."]]

    start = keymap.index(pair.first)      # => 7, 19, 13, 18
    ending = keymap.index(pair.last)      # => 26, 36, 1, 1
    if start > ending                     # => false, false, true, true
      -(keymap.size - (start - ending ))  # => 28, 23
    else
     -(ending - start)                    # => -19, -17
    end                                   # => -19, -17, -28, -23
  end                                     # => [-19, -17, -28, -23]
  the_one.rotate(rotation_offset)         # => [-17, -28, -23, -19]
  # !!! figure out where ABCD spots are.
  # multiply key vals by -1
  # run (string , key) through encrypt.rb
end

crack_runner = Crack.new  # => #<Crack:0x007ff2040882b8>







































# 1.read encrypted string in backwards
# 2. isolate the first four characters
# 3. index of the first four encrypted characters (relative to character map)
# 4. need index of the "..end.." of unencrypted message ("..dn")
# 5. subtract index of encrypted from the unencrypted
# 6. run the reversed encrypted message through the encryptor with the differences (i.e. key)
# 7. reverse your unencrypted string
#find index differences
