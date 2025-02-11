/// [1910. Remove All Occurrences of a Substring](https://leetcode.com/problems/remove-all-occurrences-of-a-substring/)
///
/// - Time complexity: O(n + m). Where m equals part.count
/// - Space complexity: O(n)
class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        let s = Array(s)
        let part = Array(part)
        let patternLength = part.count
        let lpsArray = part.lpsArray
        var result = [Character]()
        var matchIndex = 0

        for character in s {
            result.append(character)

            if character == part[matchIndex] {
                matchIndex += 1
                if matchIndex == patternLength {
                    result.removeLast(patternLength)
                    matchIndex = 0
                    guard !result.isEmpty else { continue }

                    for i in max(0, result.count - patternLength)..<result.count {
                        while matchIndex > 0 && result[i] != part[matchIndex] {
                            matchIndex = lpsArray[matchIndex - 1]
                        }
                        if result[i] == part[matchIndex] {
                            matchIndex += 1
                        }
                    }
                }
            } else {
                while matchIndex > 0 && character != part[matchIndex] {
                    matchIndex = lpsArray[matchIndex - 1]
                }
                if character == part[matchIndex] {
                    matchIndex += 1
                }
            }
        }
        return String(result)
    }
}

private extension [Character] {
    var lpsArray: [Int] {
        var lpsArray = [Int](repeating: 0, count: count)
        var patternLength = 0
        for index in 1..<count {
            if self[index] == self[index] {
                patternLength += 1
                lpsArray[index] = patternLength
            } else {
                patternLength = lpsArray[index - 1]
            }
        }
        return lpsArray
    }
}
