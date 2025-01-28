/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func maxScore(_ s: String) -> Int {
        var leftScore = s.first == "0" ? 1 : 0
        var rightScore = s.dropFirst().count(where: { $0 == "1" })
        var score = leftScore + rightScore

        for index in s.indices.dropFirst().dropLast() {
            leftScore += s[index] == "0" ? 1 : 0
            rightScore -= s[index] == "1" ? 1 : 0
            score = max(score, leftScore + rightScore)
        }
        return score
    }
}
