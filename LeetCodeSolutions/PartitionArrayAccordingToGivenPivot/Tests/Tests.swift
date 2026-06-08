import Testing
@testable import PartitionArrayAccordingToGivenPivot

@Test(arguments: [
    ([9,12,5,10,14,3,10], 10, [9,5,3,10,10,12,14]),
    ([-3,4,3,2], 2, [-3,2,4,3]),
])
func pivotArray(_ nums: [Int], _ pivot: Int, _ output: [Int]) {
    #expect(Solution().pivotArray(nums, pivot) == output)
}
