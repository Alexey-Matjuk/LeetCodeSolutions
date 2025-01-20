/// - Time complexity: O(m * n)
/// - Space complexity: O(m * n)
class Solution {
    func minCost(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let columns = grid[0].count
        var minCosts: [[Int]] = Array(repeating: Array(repeating: .max, count: columns), count: rows)
        minCosts[0][0] = 0

        var queue: [CellIndex] = [(0, 0)]
        while !queue.isEmpty {
            let cellIndex = queue.removeLast()
            let cost = minCosts[cellIndex]!
            let direction = grid[cellIndex]!

            func updateCell(_ nextCellDirection: Direction) {
                let nextIndex: CellIndex = {
                    switch nextCellDirection {
                    case .right: return (cellIndex.row, cellIndex.column + 1)
                    case .left: return (cellIndex.row, cellIndex.column - 1)
                    case .down: return (cellIndex.row + 1, cellIndex.column)
                    case .up: return (cellIndex.row - 1, cellIndex.column)
                    default: preconditionFailure("Invalid direction: \(nextCellDirection)")
                    }
                }()
                let directionCost = nextCellDirection == direction ? 0 : 1
                let newCost = cost + directionCost

                if let currentMininCost = minCosts[nextIndex], currentMininCost > newCost {
                    minCosts.setCost(newCost, at: nextIndex)
                    if directionCost == 0 {
                        queue.append(nextIndex)
                    } else {
                        queue.insert(nextIndex, at: 0)
                    }
                }
            }
            updateCell(.up)
            updateCell(.down)
            updateCell(.left)
            updateCell(.right)
        }
        return minCosts[rows - 1][columns - 1]
    }
}

private typealias Direction = Int
private extension Direction {
    static let right = 1
    static let left = 2
    static let down = 3
    static let up = 4
}

private typealias CellIndex = (row: Int, column: Int)
private extension [[Int]] {
    subscript(_ index: CellIndex) -> Int? {
        get {
            guard indices.contains(index.row),
                  self[index.row].indices.contains(index.column)
            else { return nil }
            return self[index.row][index.column]
        }
    }

    mutating
    func setCost(_ cost: Int, at index: CellIndex) {
        guard indices.contains(index.row),
              self[index.row].indices.contains(index.column)
        else { return }
        self[index.row][index.column] = cost
    }
}
