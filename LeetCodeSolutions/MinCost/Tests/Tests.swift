import Testing
@testable import MinCost

@Test func test1() async throws {
    #expect(Solution().minCost([[1,1,1,1],[2,2,2,2],[1,1,1,1],[2,2,2,2]]) == 3)
}

@Test func test2() async throws {
    #expect(Solution().minCost([[1,1,3],[3,2,2],[1,1,4]]) == 0)
}

@Test func test3() async throws {
    #expect(Solution().minCost([[1,2],[4,3]]) == 1)
}
