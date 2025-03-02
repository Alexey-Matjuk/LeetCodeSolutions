import Testing
@testable import MaxAbsoluteSum

@Test func test1() async throws {
    #expect(Solution().maxAbsoluteSum([1,-3,2,3,-4]) == 5)
}

@Test func test2() async throws {
    #expect(Solution().maxAbsoluteSum([2,-5,1,-4,3,-2]) == 8)
}
