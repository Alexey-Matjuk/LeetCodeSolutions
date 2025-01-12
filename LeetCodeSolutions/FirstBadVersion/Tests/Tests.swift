import Testing
@testable import FirstBadVersion

@Test func test1() async throws {
    let solution = Solution()
    solution.badVersion = 4
    #expect(solution.firstBadVersion(5) == 4)
}

@Test func test2() async throws {
    let solution = Solution()
    solution.badVersion = 1
    #expect(solution.firstBadVersion(1) == 1)
}
