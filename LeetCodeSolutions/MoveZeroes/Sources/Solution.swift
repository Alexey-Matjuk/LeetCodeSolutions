/// https://leetcode.com/problems/move-zeroes/description/
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNonZero: Int = 0
        for index in nums.indices {
            if 0 != nums[index] {
                nums.swapAt(lastNonZero, index)
                lastNonZero += 1
            }
        }
    }
}
