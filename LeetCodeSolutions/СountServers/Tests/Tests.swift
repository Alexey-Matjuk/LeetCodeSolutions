import Testing
@testable import СountServers

@Test func test1() async throws {
    #expect(Solution().countServers([[1,0],[0,1]]) == 0)
}

@Test func test2() async throws {
    #expect(Solution().countServers([[1,0],[1,1]]) == 3)
}

@Test func test3() async throws {
    #expect(Solution().countServers([[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]]) == 4)
}
