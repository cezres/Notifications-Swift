// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Notifications",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
        .package(url: "https://github.com/swift-server-community/APNSwift.git", from: "5.0.0-alpha.4"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Vapor", package: "vapor"),
		        .product(name: "APNSwift", package: "apnswift")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .executableTarget(
            name: "Run",
            dependencies: [.target(name: "App")]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
//        .executableTarget(name: <#T##String#>, dependencies: <#T##[Target.Dependency]#>, path: <#T##String?#>, exclude: <#T##[String]#>, sources: <#T##[String]?#>, resources: <#T##[Resource]?#>, publicHeadersPath: <#T##String?#>, cSettings: <#T##[CSetting]?#>, cxxSettings: <#T##[CXXSetting]?#>, swiftSettings: <#T##[SwiftSetting]?#>, linkerSettings: <#T##[LinkerSetting]?#>, plugins: <#T##[Target.PluginUsage]?#>)
    ]
)
