import Testing
@testable import EventualSafeNodes

@Test func test1() async throws {
    #expect(Solution().eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]]) == [2,4,5,6])
}

@Test func test2() async throws {
    #expect(Solution().eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]]) == [4])
}
