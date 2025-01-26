import Testing
@testable import MaximumInvitations

@Test func test1() async throws {
    #expect(Solution().maximumInvitations([2,2,1,2]) == 3)
}

@Test func test2() async throws {
    #expect(Solution().maximumInvitations([1,2,0]) == 3)
}

@Test func test3() async throws {
    #expect(Solution().maximumInvitations([3,0,1,4,1]) == 4)
}
