/// [1261. Find Elements in a Contaminated Binary Tree](https://leetcode.com/problems/find-elements-in-a-contaminated-binary-tree/)
///
/// - Space complexity: O(n)
class FindElements {

    private var values = Set<Int>()

    /// - Time complexity: O(n)
    init(_ root: TreeNode?) {
        guard let root else { return }
        recover(root, with: 0)
    }

    /// - Time complexity: O(1)
    func find(_ target: Int) -> Bool {
        values.contains(target)
    }
}

private extension FindElements {
    func recover(_ node: TreeNode, with value: Int) {
        values.insert(value)

        if let left = node.left {
            recover(left, with: 2 * value + 1)
        }
        if let right = node.right {
            recover(right, with: 2 * value + 2)
        }
    }
}
