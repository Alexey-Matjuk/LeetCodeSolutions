/// [2375. Construct Smallest Number From DI String](https://leetcode.com/problems/construct-smallest-number-from-di-string/)
///
/// - Time complexity: O((n +1)!)
/// - Space complexity: O(n)
class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let pattern: [Character] = pattern.map { $0 }
        var nums: [Int] = []
        var usedNumbers = Array(repeating: false, count: pattern.count + 1)
        for num in 1...pattern.count + 1 {
            nums.append(num)
            usedNumbers[num - 1] = true
            if smallestNumber(pattern, nums: &nums, usedNumbers: &usedNumbers, count: pattern.count + 1) {
                break
            }
            nums.removeLast()
            usedNumbers[num - 1] = false
        }
        return nums.reduce(into: "") { $0 += "\($1)" }
    }

    private func smallestNumber(
        _ pattern: [Character],
        nums: inout [Int],
        usedNumbers: inout [Bool],
        count: Int
    ) -> Bool {
        guard !pattern.isEmpty else { return true }
        guard let currentNumber = nums.last else { return false }

        var pattern = pattern
        let currentOperation = pattern.removeFirst()
        for nextNumber in 1...count where !usedNumbers[nextNumber - 1] {
            if currentOperation == "I" {
                if currentNumber > nextNumber {
                    continue
                }
            } else {
                if currentNumber < nextNumber {
                    continue
                }
            }
            nums.append(nextNumber)
            usedNumbers[nextNumber - 1] = true
            if smallestNumber(pattern, nums: &nums, usedNumbers: &usedNumbers, count: count) {
                return true
            }
            nums.removeLast()
            usedNumbers[nextNumber - 1] = false
        }
        return false
    }
}
