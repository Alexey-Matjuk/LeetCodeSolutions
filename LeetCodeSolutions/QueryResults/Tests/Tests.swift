import Testing
@testable import QueryResults

@Test func test1() async throws {
    #expect(Solution().queryResults(4, [[1,4],[2,5],[1,3],[3,4]]) == [1,2,2,3])
}

@Test func test2() async throws {
    #expect(Solution().queryResults(4, [[0,1],[1,2],[2,2],[3,4],[4,5]]) == [1,2,2,3,4])
}
