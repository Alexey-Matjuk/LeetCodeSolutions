// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaximumInvitations",
    platforms: [.macOS(.v15)],
    targets: [
        .target(
            name: "MaximumInvitations",
            path: "Sources"
        ),
        .testTarget(
            name: "MaximumInvitationsTests",
            dependencies: ["MaximumInvitations"],
            path: "Tests"
        ),
    ]
)
