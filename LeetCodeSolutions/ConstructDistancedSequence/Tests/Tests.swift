import Testing
@testable import ConstructDistancedSequence

@Test func test1() async throws {
    #expect(Solution().constructDistancedSequence(3) == [3,1,2,3,2])
}

@Test func test2() async throws {
    #expect(Solution().constructDistancedSequence(5) == [5,3,1,4,3,5,2,4,2])
}
