// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoveZeroes",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MoveZeroes",
            path: "Sources"
        ),
        .testTarget(
            name: "MoveZeroesTests",
            dependencies: ["MoveZeroes"],
            path: "Tests"
        ),
    ]
)
