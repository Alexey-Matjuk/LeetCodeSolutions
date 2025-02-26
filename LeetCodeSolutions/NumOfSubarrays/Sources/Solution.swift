/// [1524. Number of Sub-arrays With Odd Sum](https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        var oddCount = 0
        var evenCount = 1

        var prefixSum = 0
        var result = 0

        for num in arr {
            prefixSum += num
            if prefixSum % 2 == 0 {
                result = (result + oddCount) % 1_000_000_007
                evenCount += 1
            } else {
                result = (result + evenCount) % 1_000_000_007
                oddCount += 1
            }
        }

        return result
    }
}
