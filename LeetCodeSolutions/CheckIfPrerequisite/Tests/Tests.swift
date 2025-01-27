import Testing
@testable import CheckIfPrerequisite

@Test func test1() async throws {
    #expect(Solution().checkIfPrerequisite(2, [[1,0]], [[0,1],[1,0]]) == [false,true])
}

@Test func test2() async throws {
    #expect(Solution().checkIfPrerequisite(2, [], [[1,0],[0,1]]) == [false,false])
}

@Test func test3() async throws {
    #expect(Solution().checkIfPrerequisite(3, [[1,2],[1,0],[2,0]], [[1,0],[1,2]]) == [true,true])
}

@Test func test4() async throws {
    #expect(Solution().checkIfPrerequisite(3, [[1,2],[2,0]], [[1,0]]) == [true])
}
