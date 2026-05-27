// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LexicographicallySmallestArray",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "LexicographicallySmallestArray",
            path: "Sources"
        ),
        .testTarget(
            name: "LexicographicallySmallestArrayTests",
            dependencies: ["LexicographicallySmallestArray"],
            path: "Tests"
        ),
    ]
)
