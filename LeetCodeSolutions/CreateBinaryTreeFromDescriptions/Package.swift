// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CreateBinaryTreeFromDescriptions",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "CreateBinaryTreeFromDescriptions",
            path: "Sources"
        ),
        .testTarget(
            name: "CreateBinaryTreeFromDescriptionsTests",
            dependencies: ["CreateBinaryTreeFromDescriptions"],
            path: "Tests"
        ),
    ]
)
