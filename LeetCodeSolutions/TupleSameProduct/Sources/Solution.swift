/// - Time complexity: O(n^2)
/// - Space complexity: O(n^2)
class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        let nums = Array(Set(nums))
        var frequencyByMultiply = [Int: Int]()
        for index in 0..<nums.count {
            for oterIndex in index + 1..<nums.count {
                frequencyByMultiply[nums[index] * nums[oterIndex], default: 0] += 1
            }
        }
        var result = 0
        for frequency in frequencyByMultiply.values where frequency > 1 {
            // (frequency - 1) * frequency / 2 * 8
            result += (frequency - 1) * frequency * 4
        }
        return result
    }
}
