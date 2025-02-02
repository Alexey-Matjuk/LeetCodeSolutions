/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func check(_ nums: [Int]) -> Bool {
        var inversionNumber = 0
        for num in 0..<(nums.count - 1) where nums[num] > nums[num + 1]{
            if inversionNumber > 0 {
                return false
            }
            inversionNumber += 1
        }
        return inversionNumber == 0
        || (inversionNumber == 1 && nums[0] >= nums[nums.count - 1])
    }
}
