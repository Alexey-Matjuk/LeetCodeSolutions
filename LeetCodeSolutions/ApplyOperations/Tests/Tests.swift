import Testing
@testable import ApplyOperations

@Test func test1() async throws {
    #expect(Solution().applyOperations([1,2,2,1,1,0]) == [1,4,2,0,0,0])
}

@Test func test2() async throws {
    #expect(Solution().applyOperations([0,1]) == [1,0])
}
