/// - Time complexity: O(<#Complexity#>)
/// - Space complexity: O(<#Complexity#>)
class Solution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        var idsGrid = Array(repeating: [Int](repeating: 0, count: grid[0].count), count: grid.count)
        var islandID: Int = 1
        let directions: [CellIndex] = [.init(0, 1), .init(0, -1), .init(1, 0), .init(-1, 0)]
        var visited = Array(repeating: [Bool](repeating: false, count: grid.count), count: grid[0].count)
        var islandSizeByID = [Int: Int]()
        var maxIslandSize: Int = 0

        func isValidCellIndex(_ cellIndex: CellIndex) -> Bool {
            cellIndex.row >= 0 && cellIndex.row < grid.count
            && cellIndex.column >= 0 && cellIndex.column < grid[0].count
        }

        for row in grid.indices {
            for column in grid[row].indices where !visited[row][column] && grid[row][column] == 1 {
                var queue: [CellIndex] = [.init(row, column)]
                var islandSize = 0

                while !queue.isEmpty {
                    let currentCellIndex = queue.removeLast()
                    visited[currentCellIndex] = true
                    idsGrid[currentCellIndex] = islandID
                    islandSize += 1

                    for direction in directions {
                        let nextCellIndex = currentCellIndex.applying(direction: direction)
                        if isValidCellIndex(nextCellIndex), !visited[nextCellIndex], grid[nextCellIndex] == 1  {
                            visited[nextCellIndex] = true
                            queue.append(nextCellIndex)
                        }
                    }
                }
                islandSizeByID[islandID] = islandSize
                maxIslandSize = max(maxIslandSize, islandSize)
                islandID += 1
            }
        }

        if islandSizeByID.isEmpty { return 1 }
        if islandSizeByID.count == 1  {
            return maxIslandSize == (grid[0].count * grid.count)
            ? maxIslandSize
            : maxIslandSize + 1
        }

        for row in idsGrid.indices {
            for column in idsGrid[row].indices where !visited[row][column] && idsGrid[row][column] == 0 {
                let waterCell = CellIndex(row, column)
                visited[waterCell] = true
                var neighborIslandIDs = Set<Int>()

                for direction in directions {
                    let nextCellIndex = waterCell.applying(direction: direction)
                    if isValidCellIndex(nextCellIndex), idsGrid[nextCellIndex] > 0 {
                        neighborIslandIDs.insert(idsGrid[nextCellIndex])
                    }
                }
                maxIslandSize = max(
                    maxIslandSize,
                    neighborIslandIDs.reduce(into: 1) {
                        $0 += islandSizeByID[$1]!
                    }
                )
            }
        }
        return maxIslandSize
    }
}

private extension [[Int]] {
    subscript(_ cellIndex: CellIndex) -> Int {
        get { self[cellIndex.row][cellIndex.column] }
        set { self[cellIndex.row][cellIndex.column] = newValue }
    }
}

private extension [[Bool]] {
    subscript(_ cellIndex: CellIndex) -> Bool {
        get { self[cellIndex.row][cellIndex.column] }
        set { self[cellIndex.row][cellIndex.column] = newValue }
    }
}

private struct CellIndex: Hashable {
    let row: Int
    let column: Int

    init(_ row: Int, _ column: Int) {
        self.row = row
        self.column = column
    }

    func applying(direction: CellIndex) -> CellIndex {
        .init(row + direction.row, column + direction.column)
    }
}
