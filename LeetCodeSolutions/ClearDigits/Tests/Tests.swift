import Testing
@testable import ClearDigits

@Test func test1() async throws {
    #expect(Solution().clearDigits("abc") == "abc")
}

@Test func test2() async throws {
    #expect(Solution().clearDigits("cb34") == "")
}
