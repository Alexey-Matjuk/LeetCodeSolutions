/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var colorByBall = [Int: Int]()
        var ballsNumnerByColor = [Int: Int]()

        var results = [Int](repeating: 0, count: queries.count)
        for index in queries.startIndex..<queries.endIndex {
            let query = queries[index]
            let previousColor = colorByBall[query[0]] ?? 0

            if previousColor == query[1] {
                results[index] = results[index - 1]
                continue
            }
            colorByBall[query[0]] = query[1]
            ballsNumnerByColor[query[1], default: 0] += 1

            if let previosBallsNumber = ballsNumnerByColor[previousColor] {
                if previosBallsNumber > 1 {
                    ballsNumnerByColor[previousColor] = previosBallsNumber - 1
                } else {
                    ballsNumnerByColor[previousColor] = nil
                }
            }
            results[index] = ballsNumnerByColor.keys.count
        }
        return results
    }
}
