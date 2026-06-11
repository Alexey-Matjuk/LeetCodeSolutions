/// [3558. Number of Ways to Assign Edge Weights I](https://leetcode.com/problems/number-of-ways-to-assign-edge-weights-i/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func assignEdgeWeights(_ edges: [[Int]]) -> Int {
        var maxDepth = 0
        var graph = [Int: Set<Int>]()

        for edge in edges {
            graph[edge[0], default: Set<Int>()].insert(edge[1])
            graph[edge[1], default: Set<Int>()].insert(edge[0])
        }

        func dfs(_ node: Int, parent: Int, depth: Int) {
            maxDepth = max(maxDepth, depth)
            for neighbor in graph[node] ?? [] {
                if neighbor == parent { continue }
                dfs(neighbor, parent: node, depth: depth + 1)
            }
        }

        dfs(1, parent: -1, depth: 0)

        return pow(2, maxDepth - 1, 1000000007)
    }

    func pow(_ base: Int, _ power: Int, _ mod: Int) -> Int {
        var base = base
        var result = 1
        var power = power
        while power > 0 {
            if power % 2 == 1 {
                result = result * base % mod
            }
            base = base * base % mod
            power /= 2
        }
        return result
    }
}
