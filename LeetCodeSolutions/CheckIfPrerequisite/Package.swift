// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CheckIfPrerequisite",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "CheckIfPrerequisite",
            path: "Sources"
        ),
        .testTarget(
            name: "CheckIfPrerequisiteTests",
            dependencies: ["CheckIfPrerequisite"],
            path: "Tests"
        ),
    ]
)
