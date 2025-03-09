// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

/// Auto-generated list of solutions
let solutions = [
    "ApplyOperations",
    "AreAlmostEqual",
    "Change",
    "Check",
    "CheckIfPrerequisite",
    "ClearDigits",
    "ConstructDistancedSequence",
    "ConstructFromPrePost",
    "CountBadPairs",
    "EventualSafeNodes",
    "Find",
    "FindDifferentBinaryString",
    "FindMaxFish",
    "FirstBadVersion",
    "FirstCompleteIndex",
    "GetHappyString",
    "GridGame",
    "HighestPeak",
    "IsArraySpecial",
    "LargestIsland",
    "LexicographicallySmallestArray",
    "LongestCommonSubsequence",
    "LongestMonotonicSubarray",
    "MaxAbsoluteSum",
    "MaxProduct",
    "MaxScore",
    "MaximumInvitations",
    "MaximumSum",
    "Merge",
    "MergeArrays",
    "MinCost",
    "MinOperations",
    "MissingNumber",
    "MoveZeroes",
    "NumOfSubarrays",
    "NumTilePossibilities",
    "NumberOfAlternatingGroups",
    "ProductOfNumbers",
    "PunishmentNumber",
    "QueryResults",
    "RecoverFromPreorder",
    "RemoveOccurrences",
    "RowAndMaximumOnes",
    "Search",
    "SmallestNumber",
    "SortedSquares",
    "TupleSameProduct",
    "СountServers",
]

let package = Package(
    name: "LeetCodeSolutions",
    platforms: [.macOS(.v15)],
    targets: solutions.reduce([]) {
        $0 + [
            .target(
                name: $1,
                path: "\($1)/Sources"
            ),
            .testTarget(
                name: "\($1)Tests",
                dependencies: [.byName(name: $1)],
                path: "\($1)/Tests"
            )
        ]
    }
)
