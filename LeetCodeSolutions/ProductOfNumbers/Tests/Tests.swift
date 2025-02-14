import Testing
@testable import ProductOfNumbers

@Test func test1() async throws {
    let input = zip(
        ["ProductOfNumbers","add","add","add","add","add","getProduct","getProduct","getProduct","add","getProduct"],
        [[],[3],[0],[2],[5],[4],[2],[3],[4],[8],[2]]
    )
    var output = [Int?]()
    let expected: [Int?] = [nil,nil,nil,nil,nil,nil,20,40,0,nil,32]
    var productOfNumbers: ProductOfNumbers!
    for (action, parameters) in input {
        switch action {
            case ("ProductOfNumbers"):
            productOfNumbers = ProductOfNumbers()
            output.append(nil)
        case "add":
            productOfNumbers.add(parameters[0])
            output.append(nil)
        case "getProduct":
            output.append(productOfNumbers.getProduct(parameters[0]))
        default: continue
        }
    }
    #expect(output == expected)
}
