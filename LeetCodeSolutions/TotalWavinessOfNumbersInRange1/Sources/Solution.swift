/// [3751. Total Waviness of Numbers in Range I](https://leetcode.com/problems/total-waviness-of-numbers-in-range-i/)
///
/// - Time complexity: O((num2 - num1 + 1) * digits)
/// - Space complexity: O(digits)
final class Solution {
    func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
        guard num2 > 100 else { return 0 }
        var waviness = 0
        for num in max(100, num1)...num2 {
            waviness += num.waviness
        }
        return waviness
    }
}

private extension Int {
    var digits: [Int] {
        var digits = [Int]()
        var value = self
        while value > 0 {
            digits.append(value % 10)
            value /= 10
        }
        return digits
    }

    var waviness: Int {
        let digits = digits
        var count = 0
        for index in 1..<(digits.count - 1) where digits.isPeak(at: index) || digits.isValley(at: index) {
            count += 1
        }
        return count
    }
}

private extension [Int] {
    func isPeak(at index: Int) -> Bool {
        self[index - 1] < self[index] && self[index] > self[index + 1]
    }

    func isValley(at index: Int) -> Bool {
        self[index - 1] > self[index] && self[index] < self[index + 1]
    }
}
