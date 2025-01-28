import Testing
@testable import FindMaxFish

@Test func test1() async throws {
    #expect(Solution().findMaxFish([[0,2,1,0],[4,0,0,3],[1,0,0,4],[0,3,2,0]]) == 7)
}

@Test func test2() async throws {
    #expect(Solution().findMaxFish([[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]) == 1)
}
