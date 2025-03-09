import Testing
@testable import NumberOfAlternatingGroups

@Test func test1() async throws {
    #expect(Solution().numberOfAlternatingGroups([0,1,0,1,0], 3) == 3)
}

@Test func test2() async throws {
    #expect(Solution().numberOfAlternatingGroups([0,1,0,0,1,0,1], 6) == 2)
}

@Test func test3() async throws {
    #expect(Solution().numberOfAlternatingGroups([1,1,0,1], 4) == 0)
}
