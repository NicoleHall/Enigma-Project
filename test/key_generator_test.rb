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

  def test_it_is_formatted_to_an_array
    test_key = KeyGenerator.new
    return_value = test_key.randomize_5_digits
    assert_equal Array, return_value.class
  end

  def test_rotation_a_is_the_0_and_1_index
    key = KeyGenerator.new
    rotation_indexes = key.rotation_a
    assert_equal key.rotation_a, rotation_indexes
  end

  def test_rotation_b_is_the_1_and_2_index
    key = KeyGenerator.new
    rotation_indexes = key.rotation_b
    assert_equal key.rotation_b, rotation_indexes
  end

  def test_rotation_c_is_the_2_and_3_index
    key = KeyGenerator.new
    rotation_indexes = key.rotation_c
    assert_equal key.rotation_c, rotation_indexes
  end

  def test_rotation_d_is_the_3_and_4_index
    key = KeyGenerator.new
    rotation_indexes = key.rotation_d
    assert_equal key.rotation_d, rotation_indexes
  end

end
