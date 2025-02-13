/// [3066. Minimum Operations to Exceed Threshold Value II](https://leetcode.com/problems/minimum-operations-to-exceed-threshold-value-ii/)
///
/// - Time complexity: O(n * log n)
/// - Space complexity: O(n)
class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var queue = Heap(nums.filter { $0 < k })
        if queue.count != nums.count {
            queue.insert(k)
        }
        var operationsCount = 0

        while let x = queue.popMin(), x < k,
              let y = queue.popMin() {
            operationsCount += 1
            queue.insert(min(x, y) * 2 + max(x, y))
        }
        return operationsCount
    }
}

private struct Heap<Element: Comparable> {
    private var elements: [Element]
    @inline(__always) var min: Element? { elements.first }
    @inline(__always) var count: Int { elements.count }

    init() {
        elements = []
    }

    mutating
    func insert(_ element: Element) {
        elements.append(element)
        bubbleUp()
    }

    mutating
    func popMin() -> Element? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.endIndex - 1)
        let minElement = elements.removeLast()
        bubbleDown()
        return minElement
    }
}

private extension Heap {
    init<S: Sequence>(_ sequence: S) where S.Element == Element {
        self.init()
        elements.reserveCapacity(sequence.underestimatedCount)
        elements.append(contentsOf: sequence)
        for index in stride(from: (count - 1) / 2, through: 0, by: -1) {
            bubbleDown(from: index)
        }
    }

    mutating
    func bubbleDown(from start: Int = 0) {
        var parent = start
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var chosen = parent

            if left < count, elements[left] < elements[chosen] {
                chosen = left
            }
            if right < count, elements[right] < elements[chosen] {
                chosen = right
            }

            if chosen == parent { return }

            elements.swapAt(parent, chosen)
            parent = chosen
        }

    }

    mutating
    func bubbleUp() {
        assert(count > 0)
        var child = elements.endIndex - 1
        var parent = (child - 1) / 2
        while elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
}
