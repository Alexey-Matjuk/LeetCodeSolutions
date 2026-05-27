// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaximumSum",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MaximumSum",
            path: "Sources"
        ),
        .testTarget(
            name: "MaximumSumTests",
            dependencies: ["MaximumSum"],
            path: "Tests"
        ),
    ]
)
