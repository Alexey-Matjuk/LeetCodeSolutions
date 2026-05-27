// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmallestNumber",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "SmallestNumber",
            path: "Sources"
        ),
        .testTarget(
            name: "SmallestNumberTests",
            dependencies: ["SmallestNumber"],
            path: "Tests"
        ),
    ]
)
