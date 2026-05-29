import Testing
@testable import MinElement

@Test func test1() async throws {
    #expect(Solution().minElement([10,12,13,14]) == 1)
}

@Test func test2() async throws {
    #expect(Solution().minElement([1,2,3,4]) == 1)
}

@Test func test3() async throws {
    #expect(Solution().minElement([999,19,199]) == 10)
}
