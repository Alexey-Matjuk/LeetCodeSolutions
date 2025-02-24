import Testing
@testable import ConstructFromPrePost

@Test func test1() async throws {
    #expect(Solution().constructFromPrePost(
        [1,2,4,5,3,6,7], [4,5,2,6,7,3,1]) == TreeNode(
            1,
            .init(2, .init(4), .init(5)),
            .init(3, .init(6), .init(7))
        )
    )
}

@Test func test2() async throws {
    #expect(Solution().constructFromPrePost([1], [1]) == TreeNode(1))
}
