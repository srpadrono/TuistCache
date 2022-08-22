// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleC",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ModuleC",
            targets: ["ModuleC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.3.2"))
    ],
    targets: [
        .target(
            name: "ModuleC",
            dependencies: ["Kingfisher"]),
        .testTarget(
            name: "ModuleCTests",
            dependencies: ["ModuleC"]),
    ]
)
