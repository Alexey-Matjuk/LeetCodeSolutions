// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LongestMonotonicSubarray",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "LongestMonotonicSubarray",
            path: "Sources"
        ),
        .testTarget(
            name: "LongestMonotonicSubarrayTests",
            dependencies: ["LongestMonotonicSubarray"],
            path: "Tests"
        ),
    ]
)
