import Testing
@testable import NumTilePossibilities

@Test func test1() async throws {
    #expect(Solution().numTilePossibilities("AAB") == 8)
}

@Test func test2() async throws {
    #expect(Solution().numTilePossibilities("AAABBC") == 188)
}

@Test func test3() async throws {
    #expect(Solution().numTilePossibilities("V") == 1)
}

@Test func test4() async throws {
    #expect(Solution().numTilePossibilities("AABB") == 18)
}
