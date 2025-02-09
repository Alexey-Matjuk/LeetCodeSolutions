import Testing
@testable import CountBadPairs

@Test func test1() async throws {
    #expect(Solution().countBadPairs([4,1,3,3]) == 5)
}

@Test func test2() async throws {
    #expect(Solution().countBadPairs([1,2,3,4,5]) == 0)
}
