/// [2349. Design a Number Container System](https://leetcode.com/problems/design-a-number-container-system/)
///
/// - Time complexity: O(<#Complexity#>)
/// - Space complexity: O(<#Complexity#>)
class NumberContainers {
    var indicesHeapByNumber = [Int:Heap<Int>]()
    var indicesSetByNumber = [Int:Set<Int>]()
    var numberByIndex = [Int:Int]()

    func change(_ index: Int, _ number: Int) {
        if let existingNumber = numberByIndex[index], existingNumber != number {
            indicesSetByNumber[existingNumber]?.remove(index)
        }
        numberByIndex[index] = number
        indicesHeapByNumber[number, default: .init()].insert(index)
        indicesSetByNumber[number, default: []].insert(index)
    }

    func find(_ number: Int) -> Int {
        guard let validIndicesSet = indicesSetByNumber[number],
              var indicesHeap = indicesHeapByNumber[number]
        else { return -1 }

        indicesHeap.popMin { !validIndicesSet.contains($0) }
        indicesHeapByNumber[number] = indicesHeap

        return indicesHeap.min ?? -1
    }
}

struct Heap<T: Comparable> {
    private var elements = [T]()
    var count: Int { elements.count }
    var min: T? { elements.first }

    mutating func insert(_ value: T) {
        elements.append(value)
        bubbleUp()
    }

    @discardableResult
    mutating func popMin() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let minValue = elements.removeLast()
        bubbleDown()
        return minValue
    }

    mutating func popMin(until condition: (T) -> Bool) {
        while let min, condition(min) {
            popMin()
        }
    }
}

private extension Heap {
    mutating func bubbleUp() {
        var child = elements.endIndex - 1
        var parent = (child - 1) / 2
        while elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating func bubbleDown() {
        var parent = 0
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var chosen = parent

            if left < count && elements[left] < elements[chosen] {
                chosen = left
            }
            if right < count && elements[right] < elements[chosen] {
                chosen = right
            }
            if chosen == parent { break }
            elements.swapAt(parent, chosen)
            parent = chosen
        }
    }
}

/**
 * Your NumberContainers object will be instantiated and called as such:
 * let obj = NumberContainers()
 * obj.change(index, number)
 * let ret_2: Int = obj.find(number)
 */
