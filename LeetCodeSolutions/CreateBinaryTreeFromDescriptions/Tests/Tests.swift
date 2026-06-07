import Testing
@testable import CreateBinaryTreeFromDescriptions

@Test(arguments: [
    ([[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]], [50,20,80,15,17,19]),
    ([[1,2,1],[2,3,0],[3,4,1]], [1,2,nil,nil,3,4]),
    ([[85,74,0],[38,82,0],[39,70,0],[82,85,0],[74,13,0],[13,39,0]], [38,nil,82,nil,85,nil,74,nil,13,nil,39,nil,70])
])
func createBinaryTree(_ descriptions: [[Int]], _ output: [Int?]) {
    #expect(Solution().createBinaryTree(descriptions)?.asArray == output)
}

private extension TreeNode {
    var asArray: [Int?] {
        var result: [Int?] = []
        var queue: [TreeNode?] = [self]
        var index = 0

        while index < queue.count {
            let node = queue[index]
            index += 1

            if let node {
                result.append(node.val)
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append(nil)
            }
        }

        while result.last == .some(nil) {
            result.removeLast()
        }

        return result
    }
}
