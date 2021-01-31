require "minitest/autorun"


<<-HEREDOC
Two Sum
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.
HEREDOC


def two_sums(nums, target)
  viewed = {}
  nums.each_with_index do |num, index|
    remaining = target -  num

    if viewed[remaining]
      return [viewed[remaining], index]
    else
      viewed[num] = index
    end
  end
end

class TestTwoSums < Minitest::Test

  def test_should_return_index_that_adds_up_to_9
    nums = [2, 7, 11, 15]
    target = 9
    assert_equal  [0, 1], two_sums(nums, target)
  end

  def test_should_return_index_that_adds_up_to_6
    nums = [3, 2, 4]
    target = 6
    assert_equal  [1, 2], two_sums(nums, target)
  end

end