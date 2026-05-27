// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NumberOfSpecialChars2",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "NumberOfSpecialChars2",
            path: "Sources"
        ),
        .testTarget(
            name: "NumberOfSpecialChars2Tests",
            dependencies: ["NumberOfSpecialChars2"],
            path: "Tests"
        ),
    ]
)
