/// [2698. Find the Punishment Number of an Integer](https://leetcode.com/problems/find-the-punishment-number-of-an-integer/)
///
/// - Time complexity: O(n^2)
/// - Space complexity: O(log n)
class Solution {
    func punishmentNumber(_ n: Int) -> Int {
        var punishmentNumber = 0

        for i in 1...n where i.canBePartitioned(from: i * i) {
            punishmentNumber += i * i
        }
        return punishmentNumber
    }
}

private extension Int {
    func canBePartitioned(from target: Int) -> Bool {
        var divider = 10
        var partitionNumber = target % divider

        while partitionNumber != target {
            if (self - partitionNumber).canBePartitioned(from: target / divider) {
                return true
            }
            divider *= 10
            partitionNumber = target % divider
        }
        return partitionNumber == self
    }
}
