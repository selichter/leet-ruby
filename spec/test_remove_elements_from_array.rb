require "minitest/autorun"


<<-HEREDOC
Given a sorted array nums, remove the duplicates in-place such that each element appears only once and returns the new length.
Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

        Clarification:

        

    Example 1:

        Input: nums = [1,1,2]
    Output: 2, nums = [1,2]
    Explanation: Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the returned length.
Example 2:

Input: nums = [0,0,1,1,1,2,2,3,3,4]
Output: 5, nums = [0,1,2,3,4]
Explanation: Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively. It doesn't matter what values are set beyond the returned length.


HEREDOC


# public int removeDuplicates(int[] nums) {
#     if (nums.length == 0) return 0;
#     int i = 0;
#     for (int j = 1; j < nums.length; j++) {
#         if (nums[j] != nums[i]) {
#             i++;
#         nums[i] = nums[j];
#         }
#         }
#         return i + 1;
#         }

# with built in methods

# def remove_duplicates(nums)
#   nums.uniq!
#   nums.count
# end

#manually removing
#
def remove_duplicates(nums)
  nums.each_with_index do |num, i|
    while nums[i + 1] == num
      nums.delete_at(i)
    end
  end

  nums.count
end


class TestRemoveItemsFromArray < Minitest::Test

  def test_duplicate_count_of_two_is_returned_given_1_1_2
    assert_equal 2, remove_duplicates([1, 1, 2])
  end

  def test_count_of_three_is_returned_given_1_2_3
    assert_equal 3, remove_duplicates([1, 2, 3])
  end

  def test_removes_three_duplicates_from_array
    assert_equal 5, remove_duplicates([0, 0, 1, 1, 1, 2, 2, 3, 3, 4])
  end

  def test_array_with_only_duplicates_returns_1
    assert_equal 1, remove_duplicates([1, 1, 1, 1])
  end

  def test_array_with_five_duplicates_returns_1
    assert_equal 1, remove_duplicates([1, 1, 1, 1, 1])
  end
end
