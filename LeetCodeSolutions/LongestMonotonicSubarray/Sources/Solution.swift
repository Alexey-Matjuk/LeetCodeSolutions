/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var increasingCount = 1
        var decreasingCount = 1
        var maxCount = 1

        for index in 0..<nums.count - 1 {
            if nums[index] < nums[index + 1] {
                if decreasingCount > 1 {
                    maxCount = max(maxCount, decreasingCount)
                    decreasingCount = 1
                }
                increasingCount += 1
            } else if nums[index] > nums[index + 1] {
                if increasingCount > 1 {
                    maxCount = max(maxCount, increasingCount)
                    increasingCount = 1
                }
                decreasingCount += 1
            } else {
                maxCount = max(maxCount, max(increasingCount, decreasingCount))
                decreasingCount = 1
                increasingCount = 1
            }
        }
        return max(maxCount, max(increasingCount, decreasingCount))
    }
}
