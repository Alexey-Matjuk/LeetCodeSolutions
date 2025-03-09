/// [3208. Alternating Groups II](https://leetcode.com/problems/alternating-groups-ii/)
///
/// - Time complexity: O(n + k)
/// - Space complexity: O(1)
class Solution {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        var previousColor = colors[0]
        var currentK = 1
        var alternatingGroupsCount = 0

        for index in 1..<colors.endIndex + k - 1 {
            let currentIndex = index % colors.endIndex
            guard previousColor != colors[currentIndex] else {
                currentK = 1
                continue
            }
            previousColor = colors[currentIndex]
            if currentK + 1 == k {
                alternatingGroupsCount += 1
            } else {
                currentK += 1
            }
        }
        return alternatingGroupsCount
    }
}
