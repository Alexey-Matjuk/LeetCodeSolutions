import Testing
@testable import AreAlmostEqual

@Test func test1() async throws {
    #expect(Solution().areAlmostEqual("bank", "kanb") == true)
}

@Test func test2() async throws {
    #expect(Solution().areAlmostEqual("attack", "defend") == false)
}

@Test func test3() async throws {
    #expect(Solution().areAlmostEqual("kelb", "kelb") == true)
}
