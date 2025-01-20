import Testing
@testable import FirstCompleteIndex

@Test func test1() async throws {
    #expect(
        Solution().firstCompleteIndex(
            [1, 3, 4, 2],
            [
                [1, 4],
                [2, 3]
            ]
        ) == 2
    )
}

@Test func test2() async throws {
    #expect(
        Solution().firstCompleteIndex(
            [2, 8, 7, 4, 1, 3, 5, 6, 9],
            [
                [3, 2, 5],
                [1, 4, 6],
                [8, 7, 9]
            ]
        ) == 3
    )
}
