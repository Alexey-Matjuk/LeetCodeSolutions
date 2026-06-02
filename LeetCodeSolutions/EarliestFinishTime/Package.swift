// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EarliestFinishTime",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "EarliestFinishTime",
            path: "Sources"
        ),
        .testTarget(
            name: "EarliestFinishTimeTests",
            dependencies: ["EarliestFinishTime"],
            path: "Tests"
        ),
    ]
)
