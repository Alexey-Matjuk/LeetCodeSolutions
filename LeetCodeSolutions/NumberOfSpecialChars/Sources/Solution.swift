/// [3120. Count the Number of Special Characters I](https://leetcode.com/problems/count-the-number-of-special-characters-i/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        let word = word.utf8
        guard word.count > 1 else { return 0 }

        let uppercaseZ = "Z".utf8.first!

        let diff = "z".utf8.first! - uppercaseZ

        var lowercaseSet = Set<UTF8.CodeUnit>()
        var uppercaseSet = Set<UTF8.CodeUnit>()

        for character in word {
            if character <= uppercaseZ {
                uppercaseSet.insert(character)
            } else {
                lowercaseSet.insert(character - diff)
            }
        }
        return lowercaseSet.reduce(into: 0) {
            if uppercaseSet.contains($1) {
                $0 += 1
            }
        }
    }
}
