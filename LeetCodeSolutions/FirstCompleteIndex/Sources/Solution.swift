/// - Time complexity: O(m * n)
/// - Space complexity: O(m * n)
class Solution {
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        let rows = mat.count
        let columns = mat[0].count
        var knownValues = [Int: CellIndex]()
        var paintedRowCells = [Int](repeating: 0, count: rows)
        var paintedColumnCells = [Int](repeating: 0, count: columns)
        var resultArrIndex: Int?

        func paintCell(at index: CellIndex, arrIndex: Int) {
            paintedRowCells[index.row] += 1
            if paintedRowCells[index.row] == columns {
                resultArrIndex = arrIndex
                return
            }
            paintedColumnCells[index.column] += 1
            if paintedColumnCells[index.column] == rows {
                resultArrIndex = arrIndex
                return
            }
        }

        var matIterator = CellsIterator(base: mat)

        valuesLoop: for (index, value) in arr.enumerated() where resultArrIndex == nil {
            if let cellIndex = knownValues[value] {
                paintCell(at: cellIndex, arrIndex: index)
                continue
            }
            while let cell = matIterator.next() {
                if cell.value == value {
                    paintCell(at: cell.index, arrIndex: index)
                    continue valuesLoop
                } else {
                    knownValues[cell.value] = cell.index
                }
            }
        }
        return resultArrIndex ?? -1
    }
}

private typealias CellIndex = (row: Int, column: Int)
private struct CellsIterator: IteratorProtocol {
    typealias Element = (index: CellIndex, value: Int)
    let base: [[Int]]
    var currentRowIndex = 0
    var currentColumnIndex = 0

    mutating func next() -> Element? {
        guard currentRowIndex < base.endIndex,
              currentColumnIndex < base[0].endIndex
        else { return nil }
        defer {
            currentColumnIndex += 1
            if currentColumnIndex >= base[0].endIndex {
                currentColumnIndex = 0
                currentRowIndex += 1
            }
        }
        return (
            index: (currentRowIndex, currentColumnIndex),
            value: base[currentRowIndex][currentColumnIndex]
        )
    }
}

private struct CellValue<T: Hashable>: Hashable {
    let value: T
    let rowIndex: Int
    let columnIndex: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
