/// [3121. Count the Number of Special Characters II](https://leetcode.com/problems/count-the-number-of-special-characters-ii)
///
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        let word = word.utf8

        let uppercaseZ = "Z".utf8.first!
        let diff = "z".utf8.first! - uppercaseZ

        var lowercaseCandidates = Set<UTF8.CodeUnit>()
        var seenUppercase = Set<UTF8.CodeUnit>()

        for character in word {
            if character <= uppercaseZ {
                seenUppercase.insert(character)
                continue
            }
            let character = character - diff
            if seenUppercase.contains(character) {
                lowercaseCandidates.remove(character)
            } else {
                lowercaseCandidates.insert(character)
            }
        }

        return seenUppercase.reduce(into: 0) {
            if lowercaseCandidates.contains($1) {
                $0 += 1
            }
        }
    }
}
