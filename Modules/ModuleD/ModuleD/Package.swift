// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleD",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ModuleD",
            targets: ["ModuleD"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "ModuleD",
            dependencies: []),
        .testTarget(
            name: "ModuleDTests",
            dependencies: ["ModuleD"]),
    ]
)
