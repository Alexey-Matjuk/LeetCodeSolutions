/// https://leetcode.com/problems/move-zeroes/description/
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeros = 0
        nums.removeAll {
            if $0 == 0 {
                zeros += 1
                return true
            } else {
                return false
            }
        }
        nums.append(contentsOf: Array(repeating: 0, count: zeros))
    }
}
