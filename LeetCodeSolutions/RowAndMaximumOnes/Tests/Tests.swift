import Testing
@testable import RowAndMaximumOnes

@Test func test1() async throws {
    #expect(Solution().rowAndMaximumOnes([[0,1],[1,0]]) == [0,1])
}

@Test func test2() async throws {
    #expect(Solution().rowAndMaximumOnes([[0,0,0],[0,1,1]]) == [1,2])
}

@Test func test3() async throws {
    #expect(Solution().rowAndMaximumOnes([[0,0],[1,1],[0,0]]) == [1,2])
}
