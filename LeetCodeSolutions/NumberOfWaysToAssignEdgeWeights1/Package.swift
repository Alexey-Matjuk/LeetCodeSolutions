// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NumberOfWaysToAssignEdgeWeights1",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "NumberOfWaysToAssignEdgeWeights1",
            path: "Sources"
        ),
        .testTarget(
            name: "NumberOfWaysToAssignEdgeWeights1Tests",
            dependencies: ["NumberOfWaysToAssignEdgeWeights1"],
            path: "Tests"
        ),
    ]
)
