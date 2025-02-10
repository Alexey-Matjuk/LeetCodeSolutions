/// [3174. Clear Digits](https://leetcode.com/problems/clear-digits/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func clearDigits(_ s: String) -> String {
        var nonDigitCharacters = [Character]()
        for character in s {
            guard character.isNumber else {
                nonDigitCharacters.append(character)
                continue
            }
            if !nonDigitCharacters.isEmpty {
                nonDigitCharacters.removeLast()
            }
        }
        return String(nonDigitCharacters)
    }
}
