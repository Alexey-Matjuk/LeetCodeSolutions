/// - Time complexity: O(m * n)
/// - Space complexity: O(m + n)
class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var serversInARow = [Int](repeating: 0, count: grid.count)
        var serversInAColumn = [Int](repeating: 0, count: grid[0].count)
        var connectedServersNumber: Int = 0

        // First, we count all the servers
        for row in grid.indices {
            for (column, value) in grid[row].enumerated() where value == 1 {
                serversInARow[row] += 1
                serversInAColumn[column] += 1
                connectedServersNumber += 1
            }
        }
        // Then, we subtract all the servers that are disconnected
        for row in serversInARow.indices where serversInARow[row] == 1 {
            for column in serversInAColumn.indices where serversInAColumn[column] == 1 {
                if grid[row][column] == 1 {
                    connectedServersNumber -= 1
                }
            }
        }
        return connectedServersNumber
    }
}
