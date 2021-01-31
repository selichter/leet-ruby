require "minitest/autorun"

<<-HEREDOC
Two Sums V2
Given an array of integers numbers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
Return the indices of the two numbers (1-indexed) as an integer array answer of size 2, where 1 <= answer[0] < answer[1] <= numbers.length.
You may assume that each input would have exactly one solution and you may not use the same element twice.
HEREDOC


def two_sum(nums, target)
  viewed = {}
  nums.each_with_index do |num, index|
    remaining = target -  num

    if viewed[remaining]
      return [viewed[remaining], index + 1]
    else
      viewed[num] = index + 1
    end
  end
end


class TestTwoSumsV2 < Minitest::Test

  def test_should_return_index_that_adds_up_to_9
    nums = [2, 7, 11, 15]
    target = 9
    assert_equal  [1, 2], two_sum(nums, target)
  end

  def test_should_return_index_that_adds_up_to_6
    nums = [3, 2, 4]
    target = 6
    assert_equal  [2, 3], two_sum(nums, target)
  end

  def test_should_return_index_that_adds_up_to_neg_one
    nums = [-1, 0]
    target = -1
    assert_equal  [1, 2], two_sum(nums, target)
  end
end