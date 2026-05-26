import Testing
@testable import NumberOfSpecialChars

@Test(arguments: [
    ("aaAbcBC", 3),
    ("abc", 0),
    ("abBCab", 1),
])
func numberOfSpecialChars(_ word: String, _ result: Int) async throws {
    #expect(Solution().numberOfSpecialChars(word) == result)
}
