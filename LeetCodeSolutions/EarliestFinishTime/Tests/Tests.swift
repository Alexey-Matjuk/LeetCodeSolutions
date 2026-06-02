import Testing
@testable import EarliestFinishTime

@Test(arguments: [
    ([2,8], [4,1], [6], [3], 9),
    ([5], [3], [1], [10], 14),
    ([99], [59], [99,54], [85,20], 158),
])
func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int], _ output: Int) {
    #expect(Solution().earliestFinishTime(landStartTime, landDuration, waterStartTime, waterDuration) == output)
}
