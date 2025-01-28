/// - Time complexity: O(r * c)
/// - Space complexity: O(r * c)
class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        let directions: [CellIndex] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var maxFishNumber = 0

        for row in grid.indices {
            for column in grid[row].indices where !visited[row][column] && grid[row][column] > 0 {
                var queue: [CellIndex] = [(row, column)]
                var currentFishesNumber = 0

                while !queue.isEmpty {
                    let current = queue.removeLast()
                    guard !visited[current.row][current.column] else { continue }

                    visited[current.row][current.column] = true
                    currentFishesNumber += grid[current.row][current.column]

                    for direction in directions {
                        let row = current.row + direction.row
                        let column = current.column + direction.column

                        guard grid.indices.contains(row),
                              grid[0].indices.contains(column),
                              !visited[row][column],
                              grid[row][column] > 0
                        else { continue }

                        queue.append((row, column))
                    }
                }
                maxFishNumber = max(maxFishNumber, currentFishesNumber)
            }
        }
        return maxFishNumber
    }
}

private typealias CellIndex = (row: Int, column: Int)
