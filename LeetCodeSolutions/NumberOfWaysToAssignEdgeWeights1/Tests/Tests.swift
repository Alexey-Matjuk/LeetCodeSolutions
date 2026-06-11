import Testing
@testable import NumberOfWaysToAssignEdgeWeights1

@Test(arguments: [
    ([[1,2]], 1),
    ([[1,2],[1,3],[3,4],[3,5]], 2),
])
func assignEdgeWeights(_ edges: [[Int]], _ output: Int) {
    #expect(Solution().assignEdgeWeights(edges) == output)
}
