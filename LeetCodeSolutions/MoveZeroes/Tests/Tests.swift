import Testing
@testable import MoveZeroes

@Test func test1() async throws {
    var nums = [0,1,0,3,12]
    Solution().moveZeroes(&nums)
    #expect(nums == [1,3,12,0,0])
}

@Test func test2() async throws {
    var nums = [0]
    Solution().moveZeroes(&nums)
    #expect(nums == [0])
}
