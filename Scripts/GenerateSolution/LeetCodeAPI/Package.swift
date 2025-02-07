// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "LeetCodeAPI",
  platforms: [.macOS(.v15)],
  products: [
    .library(name: "LeetCodeAPI", targets: ["LeetCodeAPI"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", exact: "1.17.0"),
  ],
  targets: [
    .target(
      name: "LeetCodeAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
        .product(name: "Apollo", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
