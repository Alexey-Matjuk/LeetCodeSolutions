/// [1749. Maximum Absolute Sum of Any Subarray](https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        var maxSum = 0
        var minSum = 0
        var currentMaxSum = 0
        var currentMinSum = 0

        for num in nums {
            currentMaxSum += num
            currentMinSum += num

            maxSum = max(maxSum, currentMaxSum)
            minSum = min(minSum, currentMinSum)

            if currentMaxSum < 0 { currentMaxSum = 0 }
            if currentMinSum > 0 { currentMinSum = 0 }
        }
        return max(maxSum, abs(minSum))
    }
}
