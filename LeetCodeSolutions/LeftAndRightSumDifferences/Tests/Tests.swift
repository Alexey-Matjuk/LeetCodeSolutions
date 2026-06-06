import Testing
@testable import LeftAndRightSumDifferences

@Test(arguments: [
    ([10,4,8,3], [15,1,11,22]),
    ([1], [0]),
])
func leftRightDifference(_ nums: [Int], _ output: [Int]) {
    #expect(Solution().leftRightDifference(nums) == output)
}
