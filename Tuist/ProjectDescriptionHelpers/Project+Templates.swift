import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(name: name,
                                     platform: platform)
        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
        return Project(name: name,
                       organizationName: "tuist.io",
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
        let sources = Target(name: name,
                platform: platform,
                product: .framework,
                bundleId: "io.tuist.\(name)",
                infoPlist: .default,
                sources: ["Targets/\(name)/Sources/**"],
                resources: [],
                dependencies: [])
        let tests = Target(name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "io.tuist.\(name)Tests",
                infoPlist: .default,
                sources: ["Targets/\(name)/Tests/**"],
                resources: [],
                dependencies: [.target(name: name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: [.external(name: "ModuleA"),
                           .external(name: "ModuleB")]
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        
        return [mainTarget, testTarget]
    }
}

extension Project {

    public static func testApp(name: String, platform: Platform) -> Project {
        let targets = makeAppTestTargets(name: name,
                                     platform: platform)
        return Project(name: "\(name)App",
                       organizationName: "tuist.io",
                       targets: targets)
    }
    
    private static func makeAppTestTargets(name: String, platform: Platform) -> [Target] {
        
        let appName = "\(name)App"
        
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: appName,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(appName)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(appName)/Sources/**"],
            resources: ["Targets/\(appName)/Resources/**"],
            dependencies: [.external(name: name)]
        )

        let unitTestTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["../\(name)/Tests/**"],
            dependencies: [
                .external(name: "\(name)")
        ])
        
        let uiTestTarget = Target(
            name: "\(appName)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(appName)Tests",
            infoPlist: .default,
            sources: ["Targets/\(appName)/Tests/**"],
            dependencies: [
                .target(name: "\(appName)")
        ])
        
        return [mainTarget, unitTestTarget, uiTestTarget]
    }
}

