// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MissingNumber",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MissingNumber",
            path: "Sources"
        ),
        .testTarget(
            name: "MissingNumberTests",
            dependencies: ["MissingNumber"],
            path: "Tests"
        ),
    ]
)
