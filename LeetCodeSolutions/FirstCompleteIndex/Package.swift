// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirstCompleteIndex",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "FirstCompleteIndex",
            path: "Sources"
        ),
        .testTarget(
            name: "FirstCompleteIndexTests",
            dependencies: ["FirstCompleteIndex"],
            path: "Tests"
        ),
    ]
)
