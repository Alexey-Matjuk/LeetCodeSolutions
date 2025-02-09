/// [2364. Count Number of Bad Pairs](https://leetcode.com/problems/count-number-of-bad-pairs/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var countByDiff = [Int:Int]()
        var validPairsCount = 0
        for index in 0..<nums.endIndex {
            let diff = index - nums[index]
            if let diffCount = countByDiff[diff] {
                validPairsCount += diffCount
            }
            countByDiff[diff, default: 0] += 1
        }
        return (nums.count * (nums.count - 1)) / 2 // total pairs
        - validPairsCount
    }
}
