import Testing
@testable import Change

@Test func test1() async throws {
    var numberContainers: NumberContainers!
    let inputActions = ["NumberContainers","find","change","change","change","change","find","change","find"]
    let inputParametes = [[],[10],[2,10],[1,10],[3,10],[5,10],[10],[1,20],[10]]
    var output = [Int?](repeating: nil, count: inputActions.count)
    for index in 0..<inputActions.count {
        switch inputActions[index] {
        case "NumberContainers":
            numberContainers = NumberContainers()
        case "change":
            numberContainers.change(inputParametes[index][0], inputParametes[index][1])
        case "find":
            output[index] = numberContainers.find(inputParametes[index][0])
        default:
            continue
        }
    }
    #expect(output == [nil, -1, nil, nil, nil, nil, 1, nil, 2])
}
