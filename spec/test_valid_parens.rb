require "minitest/autorun"


<<-HEREDOC
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
  Open brackets must be closed by the same type of brackets.
  Open brackets must be closed in the correct order.

HEREDOC


<<-HEREDOC
What's happening in this solution
1 - initialize an empty array that we'll use as a stack holding the characters as we iterate
  * We will always add to or remove from the end of this array (lifo)
2 - we set up has that ties together the opening paren/bracket/brace with the correct closing paren/bracket/brace
3 - we iterate over each character in the input paren string
  3a - we check if the character is a key in the paren mapping. if it is, we push it onto the end of the stack array. Everything we put into the stack at this point will correspond to a key in the mapping ie.- ([{
  3b - remove the last element from the stack
       get the key we're looking for based on the value
       if the value removed from teh stack does not match the key we returned from the mapping hash, then we've failed & should return false
       if the two match, then we can happily move on with our lives
4 - if we always pass conditions 2 and 3 (3 never returns false) then everything will be removed from the stack

The lifo stack works because the closing parens need to appear in the opposite order in which they were put into the stack. 
This also allows us to remove at the correct time for symmetrical and non-symmetrical strings - non-symmetrical: `[]{{{}}}` symmetrical: `{{{}}}`
HEREDOC

def valid_parens?(parens)
  stack = []
  paren_mapping = {
      "(" => ")",
      "[" => "]",
      "{" => "}"
  }

  parens.chars.each do |char|
    if paren_mapping.key?(char)
      stack.push(char)
    elsif stack.pop != paren_mapping.key(char)
      return false
    end
  end
  stack.empty?
end

class TestValidParens < Minitest::Test
  def test_should_true_when_given_valid_parens
    assert_equal true, valid_parens?('({[]})')
  end

  def test_should_true_when_given_valid_brackets
    assert_equal true, valid_parens?('[]')
  end

  def test_should_true_when_given_valid_braces
    assert_equal true, valid_parens?('{}')
  end

  def test_should_return_true_when_given_valid_parens_brackets_braces
    assert_equal true, valid_parens?('()[]{}')
  end

  def test_should_return_false_given_open_paren_closing_bracket
    assert_equal false, valid_parens?('(]')
  end

  def test_should_return_false_given_parens_and_brackets_out_of_order
    assert_equal false, valid_parens?('([)]')
  end

  def test_returns_false_when_string_starts_with_closing_paren
    assert_equal false, valid_parens?(')([)](')
  end

  def test_returns_false_when_with_odd_number_of_parens
    assert_equal false, valid_parens?('(((())')
  end
end


