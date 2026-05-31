/// [2126. Destroying Asteroids](https://leetcode.com/problems/destroying-asteroids/)
///
/// - Time complexity: O(n  * log n)
/// - Space complexity: O(1)
class Solution {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        var mass = mass

        for asteroid in asteroids.sorted(by: <) {
            if mass < asteroid {
                return false
            }
            mass += asteroid
        }
        return true
    }
}
