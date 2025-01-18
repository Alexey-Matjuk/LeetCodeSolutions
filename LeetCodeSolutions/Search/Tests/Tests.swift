import Testing
@testable import Search

@Test func test1() async throws {
    #expect(Solution().search([4,5,6,7,0,1,2], 0) == 4)
}

@Test func test2() async throws {
    #expect(Solution().search([4,5,6,7,0,1,2], 3) == -1)
}

@Test func test3() async throws {
    #expect(Solution().search([1], 0) == -1)
}
