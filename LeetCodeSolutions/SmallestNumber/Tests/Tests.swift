import Testing
@testable import SmallestNumber

@Test func test1() async throws {
    #expect(Solution().smallestNumber("IIIDIDDD") == "123549876")
}

@Test func test2() async throws {
    #expect(Solution().smallestNumber("DDD") == "4321")
}
