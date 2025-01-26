/// - Time complexity: O(n)
/// - Space complexity: O(n)
class Solution {
    func maximumInvitations(_ favorite: [Int]) -> Int {
        var reversedFavorite = [[Int]](repeating: [], count: favorite.count)
        for person in favorite.indices {
            reversedFavorite[favorite[person]].append(person)
        }

        func findNonCycleSize(for currentPerson: Int, _ nextPerson: Int) -> Int {
            var visited = Set<Int>([currentPerson, nextPerson])
            func maxDistance(from startPerson: Int) -> Int {
                var visitedStack: [(neighbor: Int, distance: Int)] = [(startPerson, 0)]
                var maxDistance = 0
                while !visitedStack.isEmpty {
                    let (current, currentDistance) = visitedStack.removeLast()
                    for previousPerson in reversedFavorite[current] where !visited.contains(previousPerson) {
                        visited.insert(previousPerson)
                        maxDistance = max(maxDistance, currentDistance + 1)
                        visitedStack.append((previousPerson, currentDistance + 1))
                    }
                }
                return maxDistance
            }
            return 2 + maxDistance(from: nextPerson) + maxDistance(from: currentPerson)
        }

        var visited = [Bool](repeating: false, count: favorite.count)
        var maxCycleSize = 0
        var nonCycleSize = 0

        for person in favorite.indices where !visited[person] {
            var distanceForPerson = [Int: Int]()
            var currentPerson = person
            var distance = 0

            while !visited[currentPerson] {
                visited[currentPerson] = true
                distanceForPerson[currentPerson] = distance
                distance += 1
                let nextPerson = favorite[currentPerson]

                if let nextDistance = distanceForPerson[nextPerson] {
                    let cycleSize = distance - nextDistance
                    maxCycleSize = max(maxCycleSize, cycleSize)

                    guard cycleSize == 2 else { break }

                    nonCycleSize += findNonCycleSize(for: currentPerson, nextPerson)
                }
                currentPerson = nextPerson
            }
        }
        return max(maxCycleSize, nonCycleSize)
    }
}
