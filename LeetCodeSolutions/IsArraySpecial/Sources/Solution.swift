/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func isArraySpecial(_ nums: [Int]) -> Bool {
        for index in 0..<(nums.count - 1) {
            if nums[index] & 1 == nums[index + 1] & 1 {
                return false
            }
        }
        return true
    }
}
