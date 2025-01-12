/// https://leetcode.com/problems/missing-number/description/
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        nums.enumerated().reduce(0) {
            $0 ^ ($1.offset + 1) ^ $1.element
        }
    }
}
