/// [1079. Letter Tile Possibilities](https://leetcode.com/problems/letter-tile-possibilities/)
///
/// - Time complexity: O(n!)
/// - Space complexity: O(n)
class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var tileByCount = tiles.reduce(into: [:]) {
            $0[$1, default: 0] += 1
        }
        return countTileSequences(tileByCount: &tileByCount)
    }

    private func countTileSequences(tileByCount: inout [Character: Int]) -> Int {
        var tilesSequencesCount = 0
        for (tile, tileCount) in tileByCount where tileCount > 0 {
            tileByCount[tile] = tileCount - 1
            tilesSequencesCount += 1 + countTileSequences(
                tileByCount: &tileByCount
            )
            tileByCount[tile] = tileCount
        }
        return tilesSequencesCount
    }
}
