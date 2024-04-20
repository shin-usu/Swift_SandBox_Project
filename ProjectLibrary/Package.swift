// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProjectLibrary",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.4"),
        .package(url: "https://github.com/alexey1312/SnapshotTestingHEIC.git", from: "1.4.0"),
        .package(url: "https://github.com/BarredEwe/Prefire", from: "2.1.1"),
    ],
    targets: [
        .target(
            name: "AppFeature", 
            dependencies: [.prefire],
            plugins: [.prefirePlaybookPlugin]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                .appFeature,
                .snapshotTesting,
                .snapshotTestingHeic,
                .prefire,
            ],
            plugins: [.prefireTestPlugin]
        ),
    ]
)

extension Target.Dependency {
    // MARK: My Packages
    static let appFeature: Target.Dependency = "AppFeature"
    
    // MARK: Third party packages
    static let snapshotTesting: Target.Dependency = .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
    static let snapshotTestingHeic: Target.Dependency = .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC")
    static let prefire: Target.Dependency = "Prefire"
}

extension Target.PluginUsage {
    static let prefirePlaybookPlugin: Target.PluginUsage = .plugin(name: "PrefirePlaybookPlugin", package: "Prefire")
    static let prefireTestPlugin: Target.PluginUsage = .plugin(name: "PrefireTestsPlugin", package: "Prefire")
}
