/// - Time complexity: O(m * n)
/// - Space complexity: O(m * n)
class Solution {
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        guard !isWater[0].isEmpty else { return [] }

        var heights = Array(
            repeating: Array(repeating: Int.max, count: isWater[0].count),
            count: isWater.count
        )
        var cellsQueue = [CellIndex]()

        for row in isWater.indices {
            for column in isWater[0].indices where isWater[row][column] == 1 {
                heights[row][column] = 0
                cellsQueue.append((row, column))
            }
        }

        let directions: [CellIndex] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var maxHeight: Int = 1

        while !cellsQueue.isEmpty {
            /// Temporary queue fixes performance issue with array oprations we using for enqueuing and dequeuing.
            /// Enqueue: `let cellIndex = cellsQueue.remove(at: 0)`
            /// Dequeue: `cellsQueue.append(neighborCellIndex)`
            var nextCells = [CellIndex]()
            for cellIndex in cellsQueue {
                for direction in directions {
                    let neighborCellIndex = (
                        row: cellIndex.row + direction.row,
                        column: cellIndex.column + direction.column
                    )
                    guard heights.isValidCell(at: neighborCellIndex) else { continue }
                    heights[neighborCellIndex.row][neighborCellIndex.column] = maxHeight
                    nextCells.append(neighborCellIndex)
                }
            }
            cellsQueue = nextCells
            maxHeight += 1
        }
        return heights
    }
}

private typealias CellIndex = (row: Int, column: Int)
private extension [[Int]] {
    func isValidCell(at index: CellIndex) -> Bool {
        indices.contains(index.row)
        && self[index.row].indices.contains(index.column)
        && self[index.row][index.column] == .max
    }
}
