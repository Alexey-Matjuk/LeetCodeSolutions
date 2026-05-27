// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GetHappyString",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "GetHappyString",
            path: "Sources"
        ),
        .testTarget(
            name: "GetHappyStringTests",
            dependencies: ["GetHappyString"],
            path: "Tests"
        ),
    ]
)
