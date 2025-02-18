/// [977. Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var startIndex = nums.startIndex
        var endIndex = nums.endIndex - 1
        var sortedSquares = [Int](repeating: 0, count: nums.count)
        var insertIndex = endIndex

        while startIndex <= endIndex {
            if abs(nums[startIndex]) > abs(nums[endIndex]) {
                sortedSquares[insertIndex] = nums[startIndex] * nums[startIndex]
                startIndex += 1
            } else {
                sortedSquares[insertIndex] = nums[endIndex] * nums[endIndex]
                endIndex -= 1
            }

            insertIndex -= 1
        }
        return sortedSquares
    }
}
