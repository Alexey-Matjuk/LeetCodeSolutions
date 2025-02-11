import Testing
@testable import RemoveOccurrences

@Test func test1() async throws {
    #expect(Solution().removeOccurrences("daabcbaabcbc", "abc") == "dab")
}

@Test func test2() async throws {
    #expect(Solution().removeOccurrences("axxxxyyyyb", "xy") == "ab")
}
