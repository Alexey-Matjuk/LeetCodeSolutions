import Testing
@testable import MinimumCost

@Test(arguments: [
    ([1,2,3], 5),
    ([6,5,7,9,2,2], 23),
    ([5,5], 10),
    ([3,3,3,1], 7)
])
func minimumCost(_ cost: [Int], _ output: Int) {
    #expect(Solution().minimumCost(cost) == output)
}
