/// - Time complexity: O(n * log n)
/// - Space complexity: O(n)
class Solution {
    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        let sortedNums = nums.sorted()
        var sortedGroups = [[Int]]()
        var numToGroup = [Int: Int](minimumCapacity: nums.count)
        var index = 0

        while index < sortedNums.endIndex {
            var current = sortedNums[index]
            var currentGroup = [Int]()

            func addCurrentToGroup() {
                currentGroup.append(current)
                numToGroup[current] = sortedGroups.count
                index += 1
            }
            addCurrentToGroup()

            for next in sortedNums.dropFirst(index) {
                guard abs(current - next) <= limit else { break }
                current = next
                addCurrentToGroup()
            }
            sortedGroups.append(currentGroup)
        }

        // Using cursor is faster than `sortedGroups[groupIndex].removeFirst()`
        var groupsCursor = [Int](repeating: 0, count: sortedGroups.count)
        return nums.map {
            let groupIndex = numToGroup[$0]!
            defer { groupsCursor[groupIndex] += 1 }
            return sortedGroups[groupIndex][groupsCursor[groupIndex]]
        }
    }
}
