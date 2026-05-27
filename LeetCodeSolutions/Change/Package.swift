// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Change",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "Change",
            path: "Sources"
        ),
        .testTarget(
            name: "ChangeTests",
            dependencies: ["Change"],
            path: "Tests"
        ),
    ]
)
