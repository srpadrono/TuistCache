// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleA",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ModuleA",
            targets: ["ModuleA"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.5.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ModuleA",
            dependencies: ["Alamofire", .product(name: "RxCocoa", package: "RxSwift"), "RxSwift"]),
        .testTarget(
            name: "ModuleATests",
            dependencies: ["ModuleA"]),
    ]
)
