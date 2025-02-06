import Testing
@testable import TupleSameProduct

@Test func test1() async throws {
    #expect(Solution().tupleSameProduct([2,3,4,6]) == 8)
}

@Test func test2() async throws {
    #expect(Solution().tupleSameProduct([1,2,4,5,10]) == 16)
}

@Test func test3() async throws {
    #expect(Solution().tupleSameProduct([2,3,4,6,8,12]) == 40)
}
