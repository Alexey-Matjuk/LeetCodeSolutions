// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HighestPeak",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "HighestPeak",
            path: "Sources"
        ),
        .testTarget(
            name: "HighestPeakTests",
            dependencies: ["HighestPeak"],
            path: "Tests"
        ),
    ]
)
