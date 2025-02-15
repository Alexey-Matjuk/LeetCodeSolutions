import Testing
@testable import PunishmentNumber

@Test func test1() async throws {
    #expect(Solution().punishmentNumber(10) == 182)
}

@Test func test2() async throws {
    #expect(Solution().punishmentNumber(37) == 1478)
}
