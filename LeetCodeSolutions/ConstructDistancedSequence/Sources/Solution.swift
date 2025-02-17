/// [1718. Construct the Lexicographically Largest Valid Sequence](https://leetcode.com/problems/construct-the-lexicographically-largest-valid-sequence/)
///
/// - Time complexity: O(n!)
/// - Space complexity: O(n)
class Solution {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        var occupiedIndices = Set<Int>()
        var usedIntegers = Set<Int>()
        var resultSequence = Array(repeating: 0, count: n * 2 - 1)
        resultSequence.fillDistancedSequence(
            n,
            startIndex: 0,
            occupiedIndices: &occupiedIndices,
            usedIntegers: &usedIntegers
        )
        return resultSequence
    }
}

private extension [Int] {
    @discardableResult
    mutating
    func fillDistancedSequence(
        _ n: Int,
        startIndex: Int,
        occupiedIndices: inout Set<Int>,
        usedIntegers: inout Set<Int>
    ) -> Bool {
        if occupiedIndices.count == count {
            return true
        }
        for nextN in (1...n).reversed() where !usedIntegers.contains(nextN) {
            let secondIndex = startIndex + nextN
            if nextN > 1, occupiedIndices.contains(secondIndex) ||
                secondIndex >= endIndex
            { continue }

            self[startIndex] = nextN
            occupiedIndices.insert(startIndex)

            if nextN > 1 {
                self[secondIndex] = nextN
                occupiedIndices.insert(secondIndex)
            }
            usedIntegers.insert(nextN)

            if fillDistancedSequence(
                n,
                startIndex: (startIndex..<endIndex)
                    .firstIndex { !occupiedIndices.contains($0) } ?? startIndex,
                occupiedIndices: &occupiedIndices,
                usedIntegers: &usedIntegers
            ) {
                return true
            }
            self[startIndex] = 0
            occupiedIndices.remove(startIndex)
            if nextN > 1 {
                self[secondIndex] = 0
                occupiedIndices.remove(secondIndex)
            }
            usedIntegers.remove(nextN)
        }
        return false
    }
}
