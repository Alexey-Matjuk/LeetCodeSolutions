/// [2196. Create Binary Tree From Descriptions](https://leetcode.com/problems/create-binary-tree-from-descriptions/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var nodes: [Int: (node: TreeNode, hasParent: Bool)] = [:]
        for description in descriptions {
            let parent = nodes[description[0]] ?? (TreeNode(description[0]), false)
            var child = nodes[description[1]] ?? (TreeNode(description[1]), true)
            child.hasParent = true
            if description[2] == 1 {
                parent.node.left = child.node
            } else {
                parent.node.right = child.node
            }
            nodes[parent.node.val] = parent
            nodes[child.node.val] = child
        }
        return nodes.first(where: { !$0.value.hasParent })?.value.node
    }
}

private extension TreeNode {
    convenience init(_ description: [Int]) {
        self.init(
            description[0],
            description[2] == 1 ? TreeNode(description[1]) : nil,
            description[2] == 0 ? TreeNode(description[1]) : nil,
        )
    }
}
