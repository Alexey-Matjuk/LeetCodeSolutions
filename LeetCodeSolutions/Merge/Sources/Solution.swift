/// [56. Merge Intervals](https://leetcode.com/problems/merge-intervals)
///
/// - Time complexity: O(n log n)
/// - Space complexity: O(n)
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var mergedIntervals = [[
            intervals[0][0],
            intervals[0][1]
        ]]
        for index in 1..<intervals.endIndex {
            let insertIndex = mergedIntervals.endIndex - 1
            guard mergedIntervals[insertIndex][1] < intervals[index][0] else {
                mergedIntervals[insertIndex][1] = max(
                    mergedIntervals[insertIndex][1],
                    intervals[index][1]
                )
                continue
            }
            mergedIntervals.append(intervals[index])
        }
        return mergedIntervals
    }
}
