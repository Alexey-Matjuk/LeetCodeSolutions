// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MergeArrays",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MergeArrays",
            path: "Sources"
        ),
        .testTarget(
            name: "MergeArraysTests",
            dependencies: ["MergeArrays"],
            path: "Tests"
        ),
    ]
)
