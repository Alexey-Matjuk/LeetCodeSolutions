/// https://leetcode.com/problems/search-in-rotated-sorted-array/description/
/// - Time complexity: O(log n)
/// - Space complexity: O(1)
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 1 else {
            return nums[0] == target ? 0 : -1
        }
        var left = 0
        var right = nums.endIndex - 1
        while left <= right {
            let middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            }
            if nums[left] <= nums[middle] {
                if nums[left]...nums[middle] ~= target {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            } else {
                if nums[middle]...nums[right] ~= target {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
        }
        return -1
    }
}
