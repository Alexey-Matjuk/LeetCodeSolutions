import Testing
@testable import MinOperations

@Test func test1() async throws {
    #expect(Solution().minOperations([2,11,10,1,3], 10) == 2)
}

@Test func test2() async throws {
    #expect(Solution().minOperations([1,1,2,4,9], 20) == 4)
}

@Test func test3() async throws {
    #expect(Solution().minOperations([999999999,999999999,999999999], 1000000000) == 2)
}

@Test func test4() async throws {
    #expect(Solution().minOperations([19,44,61,96,84,79,84,61,97,44], 44) == 1)
}

@Test func test5() async throws {
    #expect(Solution().minOperations([72,94,72,18,20,80,97,1], 72) == 3)
}
