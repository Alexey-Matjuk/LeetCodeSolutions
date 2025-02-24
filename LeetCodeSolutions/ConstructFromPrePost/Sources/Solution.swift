/// [889. Construct Binary Tree from Preorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        let postorderIndexByValue = Dictionary(uniqueKeysWithValues: postorder.enumerated().map { ($1, $0) })

        func constructFromPrePost<C: RandomAccessCollection>(
            _ preorder: C,
            _ postorder: C
        ) -> TreeNode? where C.Element == Int, C.Index == Int {
            guard !preorder.isEmpty else { return nil }

            let rootNode = TreeNode(preorder[preorder.startIndex])
            guard preorder.count > 1 else { return rootNode }

            let leftTreeSize = postorderIndexByValue[preorder[preorder.startIndex + 1]]! - postorder.startIndex + 1

            rootNode.left = constructFromPrePost(
                preorder[(preorder.startIndex + 1)..<(preorder.startIndex + leftTreeSize + 1)],
                postorder[postorder.startIndex..<(postorder.startIndex + leftTreeSize)]
            )

            rootNode.right = constructFromPrePost(
                preorder[(preorder.startIndex + leftTreeSize + 1)...],
                postorder[(postorder.startIndex + leftTreeSize)..<(postorder.endIndex-1)]
            )
            return rootNode
        }

        return constructFromPrePost(
            preorder,
            postorder
        )
    }
}
