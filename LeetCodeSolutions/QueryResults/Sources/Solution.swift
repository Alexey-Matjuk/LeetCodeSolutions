/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func queryResults(_ limit: Int, _ queries: [[Int]]) -> [Int] {
        var colorByBall = [Int: Int]()
        var ballsNumberByColor = [Int: Int]()

        var results = [Int](repeating: 0, count: queries.count)
        for index in queries.startIndex..<queries.endIndex {
            let query = queries[index]
            let previousColor = colorByBall[query[0]] ?? 0

            if previousColor == query[1] {
                results[index] = results[index - 1]
                continue
            }
            colorByBall[query[0]] = query[1]
            ballsNumberByColor[query[1], default: 0] += 1

            if let previosBallsNumber = ballsNumberByColor[previousColor] {
                if previosBallsNumber > 1 {
                    ballsNumberByColor[previousColor] = previosBallsNumber - 1
                } else {
                    ballsNumberByColor[previousColor] = nil
                }
            }
            results[index] = ballsNumberByColor.keys.count
        }
        return results
    }
}
