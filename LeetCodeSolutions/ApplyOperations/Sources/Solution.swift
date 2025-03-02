/// [2460. Apply Operations to an Array](https://leetcode.com/problems/apply-operations-to-an-array)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func applyOperations(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        var resultIndex = 0
        var index = 0

        while index < nums.endIndex - 1 {
            if nums[index] == 0 {
                index += 1
                continue
            }
            guard nums[index] == nums[index + 1] else {
                result[resultIndex] = nums[index]
                resultIndex += 1
                index += 1
                continue
            }
            result[resultIndex] = nums[index] * 2
            resultIndex += 1
            index += 2
        }
        if index < nums.endIndex, let lastNum = nums.last {
            result[resultIndex] = lastNum
        }
        return result
    }
}
