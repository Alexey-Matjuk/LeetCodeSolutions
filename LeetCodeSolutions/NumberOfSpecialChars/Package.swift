// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NumberOfSpecialChars",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "NumberOfSpecialChars",
            path: "Sources"
        ),
        .testTarget(
            name: "NumberOfSpecialCharsTests",
            dependencies: ["NumberOfSpecialChars"],
            path: "Tests"
        ),
    ]
)
