/// [1143. Longest Common Subsequence](https://leetcode.com/problems/longest-common-subsequence)
///
/// - Time complexity: O(m * n)
/// - Space complexity: O(n)
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        let n = text2.count
        var previousRow = Array(repeating: 0, count: n + 1)
        var currentRow = Array(repeating: 0, count: n + 1)

        for i in 1...text1.count {
            for j in 1...n {
                if text1[i - 1] == text2[j - 1] {
                    currentRow[j] = 1 + previousRow[j - 1]
                } else {
                    currentRow[j] = max(previousRow[j], currentRow[j - 1])
                }
            }
            swap(&previousRow, &currentRow)
        }
        return previousRow[n]
    }
}
