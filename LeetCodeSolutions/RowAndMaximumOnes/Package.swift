// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RowAndMaximumOnes",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "RowAndMaximumOnes",
            path: "Sources"
        ),
        .testTarget(
            name: "RowAndMaximumOnesTests",
            dependencies: ["RowAndMaximumOnes"],
            path: "Tests"
        ),
    ]
)
