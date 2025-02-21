import Testing
@testable import Find

@Test func test1() async throws {
    let findElements = FindElements(
        .init(-1, nil, .init(-1))
    );
    #expect(findElements.find(1) == false)
    #expect(findElements.find(2) == true)
}

@Test func test2() async throws {
    let findElements = FindElements(
        .init(
            -1,
             .init(-1, .init(-1), .init(-1)),
             .init(-1)
        )
    )
    #expect(findElements.find(1) == true)
    #expect(findElements.find(3) == true)
    #expect(findElements.find(5) == false)
}

@Test func test3() async throws {
    let findElements = FindElements(
        .init(
            -1, nil, .init(
                -1, .init(-1), nil
            )
        )
    )
    #expect(findElements.find(2) == true)
    #expect(findElements.find(3) == false)
    #expect(findElements.find(4) == false)
    #expect(findElements.find(5) == true)
}
