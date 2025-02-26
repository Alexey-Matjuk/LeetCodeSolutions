import Testing
@testable import NumOfSubarrays

@Test func test1() async throws {
    #expect(Solution().numOfSubarrays([1,3,5]) == 4)
}

@Test func test2() async throws {
    #expect(Solution().numOfSubarrays([2,4,6]) == 0)
}

@Test func test3() async throws {
    #expect(Solution().numOfSubarrays([1,2,3,4,5,6,7]) == 16)
}
