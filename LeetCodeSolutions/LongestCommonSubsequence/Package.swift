// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LongestCommonSubsequence",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "LongestCommonSubsequence",
            path: "Sources"
        ),
        .testTarget(
            name: "LongestCommonSubsequenceTests",
            dependencies: ["LongestCommonSubsequence"],
            path: "Tests"
        ),
    ]
)
