// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

/// Auto-generated list of solutions
let solutions = [
    "EventualSafeNodes",
    "FirstBadVersion",
    "FirstCompleteIndex",
    "GridGame",
    "HighestPeak",
    "LexicographicallySmallestArray",
    "MaxProduct",
    "MaximumInvitations",
    "MinCost",
    "MissingNumber",
    "MoveZeroes",
    "RowAndMaximumOnes",
    "Search",
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
