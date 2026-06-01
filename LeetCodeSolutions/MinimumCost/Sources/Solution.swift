/// [2144. Minimum Cost of Buying Candies With Discount](https://leetcode.com/problems/minimum-cost-of-buying-candies-with-discount/)
///
/// - Time complexity: O(n * log(n) )
/// - Space complexity: O(n)
class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
        var totalCost = 0
        guard cost.count >= 3 else {
            return cost.reduce(into: 0) { $0 += $1 }
        }

        let candiesLeft = cost.count % 3
        let sorted = cost.sorted(by: >)
        for index in stride(from: cost.startIndex, to: cost.endIndex - candiesLeft, by: 3) {
            totalCost += sorted[index] + sorted[index + 1]
        }
        return sorted
            .suffix(candiesLeft)
            .reduce(into: totalCost) { $0 += $1 }
    }
}
