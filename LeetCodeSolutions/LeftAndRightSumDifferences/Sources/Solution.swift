/// [2574. Left and Right Sum Differences](https://leetcode.com/problems/left-and-right-sum-differences/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func leftRightDifference(_ nums: [Int]) -> [Int] {
        var answer = [Int](repeating: 0, count: nums.count)

        for index in nums.indices.dropFirst() {
            answer[index] = answer[index - 1] + nums[index - 1]
        }

        var rightSum = 0
        for index in nums.indices.dropLast().reversed() {
            rightSum = rightSum + nums[index + 1]
            answer[index] = abs(answer[index] - rightSum)
        }
        return answer
    }
}
