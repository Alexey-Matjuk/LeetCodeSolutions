/// [3633. Earliest Finish Time for Land and Water Rides I](https://leetcode.com/problems/earliest-finish-time-for-land-and-water-rides-i/)
///
/// - Time complexity: O(n * m)
/// - Space complexity: O(1)
class Solution {
    func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int]) -> Int {
        var minTime = Int.max
        for (landStart, landDuration) in zip(landStartTime, landDuration) {
            for (waterStart, waterDuration) in zip(waterStartTime, waterDuration) {
                minTime = min(
                    minTime,
                    max(landStart, waterStart + waterDuration) + landDuration,
                    max(waterStart, landStart + landDuration) + waterDuration
                )
            }
        }
        return minTime
    }
}
