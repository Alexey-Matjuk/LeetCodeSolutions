import Testing
@testable import NumberOfSpecialChars2

@Test(arguments: [
    ("aaAbcBC", 3),
    ("abc", 0),
    ("AbBCab", 0),
])
func numberOfSpecialChars(_ word: String, _ output: Int) {
    #expect(Solution().numberOfSpecialChars(word) == output)
}
