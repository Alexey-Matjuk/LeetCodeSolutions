/// [2161. Partition Array According to Given Pivot](https://leetcode.com/problems/partition-array-according-to-given-pivot/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var lessThanPivotNums = [Int]()
        var moreThanPivotNums = [Int]()
        var equalToPivotNums = [Int]()

        for num in nums {
            if num < pivot {
                lessThanPivotNums.append(num)
            } else if num > pivot {
                moreThanPivotNums.append(num)
            } else {
                equalToPivotNums.append(num)
            }
        }

        return lessThanPivotNums + equalToPivotNums + moreThanPivotNums
    }
}
