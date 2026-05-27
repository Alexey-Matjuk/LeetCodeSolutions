// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NumberOfAlternatingGroups",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "NumberOfAlternatingGroups",
            path: "Sources"
        ),
        .testTarget(
            name: "NumberOfAlternatingGroupsTests",
            dependencies: ["NumberOfAlternatingGroups"],
            path: "Tests"
        ),
    ]
)
