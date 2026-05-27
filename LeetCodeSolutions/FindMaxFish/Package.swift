// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FindMaxFish",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "FindMaxFish",
            path: "Sources"
        ),
        .testTarget(
            name: "FindMaxFishTests",
            dependencies: ["FindMaxFish"],
            path: "Tests"
        ),
    ]
)
