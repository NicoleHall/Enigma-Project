require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'

class DecryptTest < Minitest::Test

  def test_it_can_get_a_file
    skip
    decrypt_runner = Decrypt.new
    assert decrypt_runner.get_file
  end

  def test_it_can_
end
