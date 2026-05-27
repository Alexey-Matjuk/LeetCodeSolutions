// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QueryResults",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "QueryResults",
            path: "Sources"
        ),
        .testTarget(
            name: "QueryResultsTests",
            dependencies: ["QueryResults"],
            path: "Tests"
        ),
    ]
)
