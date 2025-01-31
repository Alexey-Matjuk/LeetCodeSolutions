import Testing
@testable import LargestIsland

@Test func test1() async throws {
    #expect(Solution().largestIsland([[1,0],[0,1]]) == 3)
}

@Test func test2() async throws {
    #expect(Solution().largestIsland([[1,1],[1,0]]) == 4)
}

@Test func test3() async throws {
    #expect(Solution().largestIsland([[1,1],[1,1]]) == 4)
}

@Test func test4() async throws {
    #expect(Solution().largestIsland([[0,0,0,0,0,0,0],[0,1,1,1,1,0,0],[0,1,0,0,1,0,0],[1,0,1,0,1,0,0],[0,1,0,0,1,0,0],[0,1,0,0,1,0,0],[0,1,1,1,1,0,0]]) == 18)
}

@Test func test5() async throws {
    #expect(Solution().largestIsland([[0,1,1,1,1,0],[0,1,1,1,1,1],[0,0,0,0,0,1],[1,0,0,1,0,0],[1,0,0,1,0,1],[0,1,1,0,1,0]]) == 13)
}
