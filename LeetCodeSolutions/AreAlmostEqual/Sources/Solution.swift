/// - Time complexity: O(n)
/// - Space complexity: O(1)
class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        var differences = [String.Index]()
        for index in s1.indices {
            if s1[index] != s2[index] {
                differences.append(index)
            }
            if differences.count > 2 {
                return false
            }
        }
        switch differences.count {
        case 0: return true
        case 1: return false
        default: // 2
            return s1[differences[0]] == s2[differences[1]] && s1[differences[1]] == s2[differences[0]]
        }
    }
}
