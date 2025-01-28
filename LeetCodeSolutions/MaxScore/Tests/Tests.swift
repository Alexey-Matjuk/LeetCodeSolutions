import Testing
@testable import MaxScore

@Test func test1() async throws {
    #expect(Solution().maxScore("011101") == 5)
}

@Test func test2() async throws {
    #expect(Solution().maxScore("00111") == 5)
}

@Test func test3() async throws {
    #expect(Solution().maxScore("1111") == 3)
}
