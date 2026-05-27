// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductOfNumbers",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "ProductOfNumbers",
            path: "Sources"
        ),
        .testTarget(
            name: "ProductOfNumbersTests",
            dependencies: ["ProductOfNumbers"],
            path: "Tests"
        ),
    ]
)
