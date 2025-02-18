import Testing
@testable import SortedSquares

@Test func test1() async throws {
    #expect(Solution().sortedSquares([-4,-1,0,3,10]) == [0,1,9,16,100])
}

@Test func test2() async throws {
    #expect(Solution().sortedSquares([-7,-3,2,3,11]) == [4,9,9,49,121])
}
