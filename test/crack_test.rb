require 'minitest/autorun'
require 'minitest/pride'
require "../lib/crack"

class CrackTest< Minitest::Test

 def test_breaks_template_into_array
  crack_runner = Crack.new
  encrypted_message = "mne7tui8jv9"
  result = ["8", "j", "v", "9"]
  assert_equal result, crack_runner.get_last_four(encrypted_message)
 end

 def test_does_not_flip_zero
   crack = Crack.new
   number = 0
   flipped = crack.flip_one_and_three 0

   assert_equal 0, flipped
 end

 def test_flips_one
   crack = Crack.new
   number = 0
   flipped = crack.flip_one_and_three 1

   assert_equal 3, flipped
 end

 def test_flips_three
   crack = Crack.new
   number = 0
   flipped = crack.flip_one_and_three 3

   assert_equal 1, flipped
 end



end
