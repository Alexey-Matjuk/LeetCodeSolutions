import Testing
@testable import GetHappyString

@Test func test1() async throws {
    #expect(Solution().getHappyString(1, 3) == "c")
}

@Test func test2() async throws {
    #expect(Solution().getHappyString(1, 4) == "")
}

@Test func test3() async throws {
    #expect(Solution().getHappyString(3, 9) == "cab")
}
