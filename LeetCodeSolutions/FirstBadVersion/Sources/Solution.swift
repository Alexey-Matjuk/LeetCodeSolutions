/// https://leetcode.com/problems/first-bad-version/description/
/// - Time complexity: O(log n)
/// - Space complexity: O(1)
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        if n == 1, isBadVersion(n) { return n }

        var high = n
        var low = 1

        while low <= high {
            let mid = (low + high) / 2

            if isBadVersion(mid) {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return high + 1
    }
}
