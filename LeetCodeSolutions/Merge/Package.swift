// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Merge",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "Merge",
            path: "Sources"
        ),
        .testTarget(
            name: "MergeTests",
            dependencies: ["Merge"],
            path: "Tests"
        ),
    ]
)
