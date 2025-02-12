/// [2342. Max Sum of a Pair With Equal Sum of Digits](https://leetcode.com/problems/max-sum-of-a-pair-with-equal-sum-of-digits/)
///
/// - Time complexity: O(n * log Int.max)  -> O(n * log 19) -> O(n * 1) -> O(n)
/// - Space complexity: O(n)
class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var maxNumByDigitsSum = [Int: Int]()
        var maxSum = -1
        for index in 0..<nums.count {
            let digitsSum = nums[index].digitsSum
            guard let maxNum = maxNumByDigitsSum[digitsSum] else {
                maxNumByDigitsSum[digitsSum] = nums[index]
                continue
            }
            maxSum = max(maxSum, maxNum + nums[index])
            if nums[index] > maxNum {
                maxNumByDigitsSum[digitsSum] = nums[index]
            }
        }
        return maxSum
    }
}

private extension Int {
    var digitsSum: Int {
        var sum = 0
        var num = self
        while num != 0 {
            let divResult = num.quotientAndRemainder(dividingBy: 10)
            sum += divResult.remainder
            num = divResult.quotient
        }
        return sum
    }
}
