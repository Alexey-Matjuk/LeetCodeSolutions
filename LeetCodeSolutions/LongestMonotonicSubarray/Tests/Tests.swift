import Testing
@testable import LongestMonotonicSubarray

@Test func test1() async throws {
    #expect(Solution().longestMonotonicSubarray([1,4,3,3,2]) == 2)
}

@Test func test2() async throws {
    #expect(Solution().longestMonotonicSubarray([3,3,3,3]) == 1)
}

@Test func test3() async throws {
    #expect(Solution().longestMonotonicSubarray([3,2,1]) == 3)
}
