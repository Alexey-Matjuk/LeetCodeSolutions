// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeftAndRightSumDifferences",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "LeftAndRightSumDifferences",
            path: "Sources"
        ),
        .testTarget(
            name: "LeftAndRightSumDifferencesTests",
            dependencies: ["LeftAndRightSumDifferences"],
            path: "Tests"
        ),
    ]
)
