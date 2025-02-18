import Testing
@testable import Merge

@Test func test1() async throws {
    #expect(Solution().merge([[1,3],[2,6],[8,10],[15,18]]) == [[1,6],[8,10],[15,18]])
}

@Test func test2() async throws {
    #expect(Solution().merge([[1,4],[4,5]]) == [[1,5]])
}
