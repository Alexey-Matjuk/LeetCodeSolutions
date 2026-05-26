/// [1092. Shortest Common Supersequence ](https://leetcode.com/problems/shortest-common-supersequence)
///
/// - Time complexity: O(<#Complexity#>)
/// - Space complexity: O(<#Complexity#>)
class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        var longestStr: String
        var shortestStr: String

        if str1.count > str2.count {
            longestStr = str1
            shortestStr = str2
        } else {
            longestStr = str2
            shortestStr = str1
        }

        if longestStr.contains(shortestStr) {
            return longestStr
        }
        var result = shortestStr + longestStr
        for dropCount in 1..<shortestStr.count {
            let newPrefix = shortestStr.dropFirst(dropCount)
            if longestStr.hasPrefix(newPrefix) {
                result = shortestStr.prefix(dropCount) + longestStr
                break
            }
            let newSuffix = shortestStr.dropLast(dropCount)
            if longestStr.hasSuffix(newSuffix) {
                result = longestStr + shortestStr.suffix(dropCount)
                break
            }
        }
        return result
    }
}
