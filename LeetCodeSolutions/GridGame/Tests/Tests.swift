import Testing
@testable import GridGame

@Test func test1() async throws {
    #expect(Solution().gridGame([[2,5,4],[1,5,1]]) == 4)
}

@Test func test2() async throws {
    #expect(Solution().gridGame([[3,3,1],[8,5,2]]) == 4)
}

@Test func test3() async throws {
    #expect(Solution().gridGame([[1,3,1,15],[1,3,3,1]]) == 7)
}
