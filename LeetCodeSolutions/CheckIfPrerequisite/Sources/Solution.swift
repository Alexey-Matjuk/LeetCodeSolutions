/// - p: is the number of prerequisites where p[i].count == 2
/// - c: is the number of courses
/// - q: is the number of queries
/// - Time complexity: O(p + q * p)
/// - Space complexity: O(c + p)
class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var prerequisitesGraph = Array(repeating: Set<Int>(), count: numCourses)
        for prerequisity in prerequisites {
            prerequisitesGraph[prerequisity[1]].insert(prerequisity[0])
        }
        var result = [Bool](repeating: false, count: queries.count)
        queriesLoop: for (index, query) in queries.enumerated() {
            var visitedCourses = [Bool](repeating: false, count: numCourses)
            var stack = [query[1]]
            while !stack.isEmpty {
                let currentCourse = stack.removeLast()
                if visitedCourses[currentCourse] { continue }

                if prerequisitesGraph[currentCourse].contains(query[0]) {
                    result[index] = true
                    continue queriesLoop
                } else {
                    visitedCourses[currentCourse] = true
                    stack.append(contentsOf: prerequisitesGraph[currentCourse])
                }
            }
        }
        return result
    }
}
