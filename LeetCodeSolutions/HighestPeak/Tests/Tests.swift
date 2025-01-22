import Testing
@testable import HighestPeak

@Test func test1() async throws {
    #expect(
        Solution().highestPeak(
            [
                [0,1],
                [0,0]
            ]
        ) == [
            [1,0],
            [2,1]
        ]
    )
}

@Test func test2() async throws {
    #expect(
        Solution().highestPeak(
            [
                [0,0,1],
                [1,0,0],
                [0,0,0]
            ]
        ) == [
            [1,1,0],
            [0,1,1],
            [1,2,2]
        ]
    )
}
