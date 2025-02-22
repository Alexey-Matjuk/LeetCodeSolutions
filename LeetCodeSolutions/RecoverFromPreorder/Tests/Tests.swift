import Testing
@testable import RecoverFromPreorder

@Test func test1() async throws {
    #expect(Solution().recoverFromPreorder("1-2--3--4-5--6--7") == .init(
        1,
        .init(
            2,
            .init(3),
            .init(4)
        ),
        .init(
            5,
            .init(6),
            .init(7)
        )
    ))
}

@Test func test2() async throws {
    #expect(Solution().recoverFromPreorder("1-2--3---4-5--6---7") == .init(
        1,
        .init(
            2,
            .init(
                3,
                .init(4)
            )
        ),
        .init(
            5,
            .init(
                6,
                .init(7)
            )
        )
    ))
}

@Test func test3() async throws {
    #expect(Solution().recoverFromPreorder("1-401--349---90--88") == .init(
        1,
        .init(
            401,
            .init(
                349,
                .init(90)
            ),
            .init(88)
        )
    ))
}
