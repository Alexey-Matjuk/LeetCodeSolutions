/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func rowAndMaximumOnes(_ mat: [[Int]]) -> [Int] {
        var result = [Int.min, Int.min]
        for (rowIndex, row) in mat.enumerated() {
            let maxOnesCount = row.count { $0 == 1 }
            if result[1] < maxOnesCount {
                result[0] = rowIndex
                result[1] = maxOnesCount
            }
        }
        return result
    }
}
