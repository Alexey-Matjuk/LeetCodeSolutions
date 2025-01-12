import Testing
@testable import MissingNumber

@Test func test1() async throws {
    #expect(Solution().missingNumber([3,0,1]) == 2)
}

@Test func test2() async throws {
    #expect(Solution().missingNumber([0,1]) == 2)
}

@Test func test3() async throws {
    #expect(Solution().missingNumber([9,6,4,2,3,5,7,0,1]) == 8)
}
