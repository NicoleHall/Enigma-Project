require 'minitest/autorun'
require 'minitest/pride'
require "../lib/time"
require "../lib/key_generator"
require '../lib/offset_calc'

class Offset_calcTest < Minitest::Test

  def test_offset_calc_has_access_to_key_generator
    key_sample = KeyGenerator.new
    assert key_sample.rotation_collector
  end

  def test_rotation_collection_has_4_values
    key_sample = KeyGenerator.new
    result = key_sample.rotation_collector
    assert_equal 4, result.length
  end

  def test_offset_calc_has_access_to_formatted_time_from_Time_class
    moment = Offset.new
    assert_equal 260715, moment.retrieve_time
  end

  def test_offset_calc_can_square_retrieved_time
    moment = Offset.new
    assert moment.format_time_offsets
  end

  def test_it_grabs_last_four_digits_of_time
    offset_four_digit = Offset.new
    assert_equal 4 , offset_four_digit.format_time_offsets.length
  end

end
