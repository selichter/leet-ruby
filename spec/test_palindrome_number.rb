require "minitest/autorun"

<<-HEREDOC
Given an integer x, return true if x is palindrome integer.
An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.
HEREDOC



def is_palindrome(x)
  string_input = x.to_s.chars
  string_input == string_input.reverse
end

# alternative option
# def is_palindrome(x)
#   string_input = x.to_s.chars
#   clean_string_input = string_input.clone
#   reversed_input = []
#   string_input.each {|char| reversed_input.unshift(char)}
#   reversed_input == clean_string_input
# end

class TestIsPalindrome < Minitest::Test
  def test_121_returns_true
    assert is_palindrome(121)
  end

  def test_negative_121_returns_false
    assert_equal false, is_palindrome(-121)
  end

  def test_10_returns_false
    assert_equal false , is_palindrome(10)
  end
end

