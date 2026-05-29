/// [3300. Minimum Element After Replacement With Digit Sum](https://leetcode.com/problems/minimum-element-after-replacement-with-digit-sum/)
///
/// - Time complexity: O(n * d), effectively O(n)
/// - Space complexity: O(1)
class Solution {
    func minElement(_ nums: [Int]) -> Int {
        nums.reduce(into: Int.max) {
            var sum = 0
            var number = $1
            while number > 0 {
                let quotientAndRemainder = number.quotientAndRemainder(dividingBy: 10)
                number = quotientAndRemainder.quotient
                sum += quotientAndRemainder.remainder
            }
            $0 = min($0, sum)
        }
    }
}
