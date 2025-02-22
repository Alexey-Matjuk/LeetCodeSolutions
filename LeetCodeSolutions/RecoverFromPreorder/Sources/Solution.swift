/// [1028. Recover a Tree From Preorder Traversal](https://leetcode.com/problems/recover-a-tree-from-preorder-traversal/)
///
/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        let traversal = Array(traversal)
        var depth = traversal.countFirst("-")
        var (number, numberRange) = traversal.numberAndRange(from: 0)
        let rootNode = TreeNode(.init(number))
        var currentBranch = [rootNode]
        while numberRange.endIndex < traversal.endIndex {
            depth = traversal[numberRange.endIndex...].countFirst("-")
            (number, numberRange) = traversal.numberAndRange(
                from: numberRange.endIndex + depth
            )
            let recoveredNode = TreeNode(.init(number))
            if currentBranch.count > depth {
                currentBranch.removeLast(currentBranch.count - depth)
            }
            guard let nodeToFill = currentBranch.last
            else {
                assertionFailure("Constraints are violated.")
                return nil
            }
            if nodeToFill.left == nil {
                nodeToFill.left = recoveredNode
            } else {
                nodeToFill.right = recoveredNode
            }
            currentBranch.append(recoveredNode)
        }
        return rootNode
    }
}

private extension UInt8 {
    static let asciiZero = Character("0").asciiValue!
}

private extension [Character] {
    func numberAndRange(from startIndex: Index) -> (number: Int, range: Range<Index>) {
        var number = 0
        for index in startIndex..<endIndex {
            if self[index] == "-" {
                return (number, startIndex..<index)
            }
            number = number * 10 + Int(self[index].asciiValue! - UInt8.asciiZero)
        }
        return (number, startIndex..<endIndex)
    }
}

private extension Sequence where Element: Equatable {
    func countFirst(_ element: Element) -> Int {
        var count = 0
        for currentElement in self {
            guard currentElement == element else { return count }
            count += 1
        }
        return count
    }
}
