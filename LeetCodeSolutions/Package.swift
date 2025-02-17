// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

/// Auto-generated list of solutions
let solutions = [
    "AreAlmostEqual",
    "Change",
    "Check",
    "CheckIfPrerequisite",
    "ClearDigits",
    "ConstructDistancedSequence",
    "CountBadPairs",
    "EventualSafeNodes",
    "FindMaxFish",
    "FirstBadVersion",
    "FirstCompleteIndex",
    "GridGame",
    "HighestPeak",
    "IsArraySpecial",
    "LargestIsland",
    "LexicographicallySmallestArray",
    "LongestMonotonicSubarray",
    "MaxProduct",
    "MaxScore",
    "MaximumInvitations",
    "MaximumSum",
    "MinCost",
    "MinOperations",
    "MissingNumber",
    "MoveZeroes",
    "ProductOfNumbers",
    "PunishmentNumber",
    "QueryResults",
    "RemoveOccurrences",
    "RowAndMaximumOnes",
    "Search",
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
