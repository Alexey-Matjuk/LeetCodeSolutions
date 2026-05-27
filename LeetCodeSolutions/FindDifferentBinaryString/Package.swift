// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FindDifferentBinaryString",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "FindDifferentBinaryString",
            path: "Sources"
        ),
        .testTarget(
            name: "FindDifferentBinaryStringTests",
            dependencies: ["FindDifferentBinaryString"],
            path: "Tests"
        ),
    ]
)
