require "simplecov"
# SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "../lib/encrypt"

class EncryptTest < Minitest::Test

  def test_it_can_rotate_one_single_letter_when_given_a_value
    encrypt_test = Encrypt.new
    assert "b", encrypt_test.encrypt_character("a", 40)
  end

  def test_it_can_handle_uppercase_letters
    encrypt_test = Encrypt.new
    assert "b", encrypt_test.encrypt_character("A", 40)
  end
end
