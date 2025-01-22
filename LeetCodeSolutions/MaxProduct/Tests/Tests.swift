import Testing
@testable import MaxProduct


@Test func test1() async throws {
    #expect(Solution().maxProduct([3,4,5,2]) == 12)
}

@Test func test2() async throws {
    #expect(Solution().maxProduct([1,5,4,5]) == 16)
}

@Test func test3() async throws {
    #expect(Solution().maxProduct([3,7]) == 12)
}

