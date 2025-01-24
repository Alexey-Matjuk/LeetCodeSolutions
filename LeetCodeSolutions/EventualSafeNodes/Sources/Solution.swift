/// - Time complexity: O(n + edeges)
/// - Space complexity: O(n)
class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        guard !graph.isEmpty else { return [] }
        var unsafeNodes = [Bool](repeating: false, count: graph.count)
        var visitedNodes = [Bool](repeating: false, count: graph.count)

        @discardableResult
        func hasUnsafePath(_ node: Int) -> Bool {
            if unsafeNodes[node] { return true }
            if visitedNodes[node] { return false }

            visitedNodes[node] = true
            unsafeNodes[node] = true

            if graph[node].contains(where: hasUnsafePath) {
                return true
            }

            unsafeNodes[node] = false
            return false
        }

        graph.indices.forEach { hasUnsafePath($0) }

        return unsafeNodes.enumerated()
            .compactMap { $0.element ? nil : $0.offset }
    }
}
