require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key_generator'

class EnigmaTest < Minitest::Test

  def test_it_has_a_class
    assert key = KeyGenerator.new
  end

  def test_when_random_num_is_called_5_digit_integer_is_created
    n = KeyGenerator.new
    return_value = n.randomize_5_digits
    assert_equal 5, return_value.length
  end

  def test_all_rotations_have_a_value
    n = KeyGenerator.new
    n.rotations.each do |key, value|
      assert n.rotations[key]
    end
  end
end
