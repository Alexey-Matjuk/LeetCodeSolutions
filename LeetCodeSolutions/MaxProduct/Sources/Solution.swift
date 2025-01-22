/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var max1 = Int.min
        var max2 = Int.min
        for num in nums {
            if num > max1 {
                max2 = max1
                max1 = num
            } else {
                max2 = max(num, max2)
            }
        }
        return (max1 - 1) * (max2 - 1)
    }
}
