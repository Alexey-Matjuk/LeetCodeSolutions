import Testing
@testable import IsArraySpecial

@Test func test1() async throws {
    #expect(Solution().isArraySpecial([1]) == true)
}

@Test func test2() async throws {
    #expect(Solution().isArraySpecial([2,1,4]) == true)
}

@Test func test3() async throws {
    #expect(Solution().isArraySpecial([4,3,1,6]) == false)
}
