import Testing
@testable import MergeArrays

@Test func test1() async throws {
    #expect(Solution().mergeArrays([[1,2],[2,3],[4,5]], [[1,4],[3,2],[4,1]]) == [[1,6],[2,3],[3,2],[4,6]])
}

@Test func test2() async throws {
    #expect(Solution().mergeArrays([[2,4],[3,6],[5,5]], [[1,3],[4,3]]) == [[1,3],[2,4],[3,6],[4,3],[5,5]])
}
