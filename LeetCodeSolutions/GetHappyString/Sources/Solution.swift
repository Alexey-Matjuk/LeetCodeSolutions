/// [1415. The k-th Lexicographical String of All Happy Strings of Length n](https://leetcode.com/problems/the-k-th-lexicographical-string-of-all-happy-strings-of-length-n/)
///
/// - Time complexity: O(2^n)
/// - Space complexity: O(n)
class Solution {
    private static let happyLetters: [Character] = ["a", "b", "c"]
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let totalHappyStringsCount = 3 * (1 << n - 1) // 3 * 2 ^ (n - 1)
        if k > totalHappyStringsCount {
            return ""
        }
        var k = k
        var currentHappyStringLetters = [Character]()
        func updateHappyStringLetters() {
            if currentHappyStringLetters.count == n {
                k -= 1
                return
            }
            for nextLetter in Self.happyLetters where currentHappyStringLetters.last != nextLetter {
                currentHappyStringLetters.append(nextLetter)
                updateHappyStringLetters()
                if k == 0 { return }
                currentHappyStringLetters.removeLast()
            }
        }
        updateHappyStringLetters()
        return k > 0 ? "" : String(currentHappyStringLetters)
    }
}
