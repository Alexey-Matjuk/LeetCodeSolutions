import Testing
@testable import Check

@Test func test1() async throws {
    #expect(Solution().check([3,4,5,1,2]) == true)
}

@Test func test2() async throws {
    #expect(Solution().check([2,1,3,4]) == false)
}

@Test func test3() async throws {
    #expect(Solution().check([1,2,3]) == true)
}
