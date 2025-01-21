/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        var topSum = grid[0].reduce(into: 0) { $0 += $1 }
        var bottomSum = 0
        var minSum = Int.max

        for column in grid[0].indices {
            topSum -= grid[0][column]
            minSum = min(minSum, max(topSum, bottomSum))
            bottomSum += grid[1][column]
        }
        return minSum
    }
}
