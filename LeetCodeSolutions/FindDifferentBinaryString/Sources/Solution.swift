/// [1980. Find Unique Binary String](https://leetcode.com/problems/find-unique-binary-string/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        var result = String(repeating: "0", count: nums.count)
        for offset in 0..<nums.endIndex {
            let num = nums[offset]
            let bitIndex = num.index(num.startIndex, offsetBy: offset)
            guard num[bitIndex] == "0" else { continue }
            result.replaceSubrange(bitIndex...bitIndex, with: "1")
        }
        return result
    }
}
