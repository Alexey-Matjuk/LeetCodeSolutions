/// [1871. Jump Game VII](https://leetcode.com/problems/jump-game-vii/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
        if s.last == "1" { return false }

        let s = s.utf8CString
        let count = s.count - 1

        var dp = [Bool](repeating: false, count: count)
        dp[0] = true

        let zeroCharacter = "0".utf8CString.first!

        var validJumpsCount = 0
        for j in minJump..<count {
            if dp[j - minJump] {
                validJumpsCount += 1
            }
            let indexToRemove = j - maxJump - 1
            if indexToRemove >= 0, dp[indexToRemove] {
                validJumpsCount -= 1
            }
            dp[j] = s[j] == zeroCharacter && validJumpsCount > 0
        }
        return dp.last ?? false
    }
}
