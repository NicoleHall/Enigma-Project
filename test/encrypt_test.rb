require "simplecov"         # => true
# SimpleCov.start
require "minitest/autorun"  # => true
require "minitest/pride"    # => true
require "../lib/encrypt"    # ~> LoadError: cannot load such file -- ../lib/encrypt

class EncryptTest < Minitest::Test

  def test_it_can_rotate_one_single_letter_when_given_a_value
    encrypt_test = Encrypt.new
    assert_equal "b", encrypt_test.encrypt_character("a", 41)
  end

  def test_it_can_handle_uppercase_letters
    encrypt_test = Encrypt.new
    assert_equal "b", encrypt_test.encrypt_character("A", 41)
  end

  def test_it_can_encrypt_two_chars
    encrypt_test = Encrypt.new
    assert_equal ["y","g"], encrypt_test.encrypt("du")
  end



end

# >> Run options: --seed 46208
# >>
# >> # Running:
# >>
# >>
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.000694s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> LoadError
# ~> cannot load such file -- ../lib/encrypt
# ~>
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/Turing/module1/week_3/enigma2/test/encrypt_test.rb:5:in `<main>'
