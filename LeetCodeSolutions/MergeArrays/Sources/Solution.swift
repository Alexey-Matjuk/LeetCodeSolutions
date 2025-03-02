/// [2570. Merge Two 2D Arrays by Summing Values](https://leetcode.com/problems/merge-two-2d-arrays-by-summing-values/)
///
/// - Time complexity: O(n + m)
/// - Space complexity: O(n + m)
class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var mergedArray = [[Int]]()
        var num1Index = 0
        var num2Index = 0

        while num1Index < nums1.endIndex, num2Index < nums2.endIndex {
            if nums1[num1Index][0] == nums2[num2Index][0] {
                mergedArray.append([
                    nums1[num1Index][0],
                    nums1[num1Index][1] + nums2[num2Index][1]
                ])
                num1Index += 1
                num2Index += 1
            } else if nums1[num1Index][0] < nums2[num2Index][0] {
                mergedArray.append(nums1[num1Index])
                num1Index += 1
            } else {
                mergedArray.append(nums2[num2Index])
                num2Index += 1
            }
        }
        if num1Index < nums1.endIndex {
            mergedArray.append(contentsOf: nums1[num1Index...])
        }
        if num2Index < nums2.endIndex {
            mergedArray.append(contentsOf: nums2[num2Index...])
        }
        return mergedArray
    }
}
