import Testing
@testable import MaximumSum

@Test func test1() async throws {
    #expect(Solution().maximumSum([18,43,36,13,7]) == 54)
}

@Test func test2() async throws {
    #expect(Solution().maximumSum([10,12,19,14]) == -1)
}
