import Testing
@testable import LongestCommonSubsequence

@Test func test1() async throws {
    #expect(Solution().longestCommonSubsequence("abcde", "ace") == 3)
}

@Test func test2() async throws {
    #expect(Solution().longestCommonSubsequence("abc", "abc") == 3)
}

@Test func test3() async throws {
    #expect(Solution().longestCommonSubsequence("abc", "def") == 0)
}
