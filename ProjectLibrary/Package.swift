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
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.15.4"
          ),
        .package(url: "https://github.com/alexey1312/SnapshotTestingHEIC.git", from: "1.4.0"),
        .package(url: "https://github.com/BarredEwe/Prefire", from: "2.1.1"),
    ],
    targets: [
        .target(
            name: "AppFeature", dependencies: ["Prefire"], plugins: [.plugin(name: "PrefirePlaybookPlugin", package: "Prefire")]),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                "AppFeature",
                .snapshotTesting,
                .snapshotTestingHeic,
                "Prefire",
            ],
            plugins: [.plugin(name: "PrefireTestsPlugin", package: "Prefire")]
        ),
    ]
)

extension Target.Dependency {
    static let snapshotTesting: Target.Dependency = .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
    static let snapshotTestingHeic: Target.Dependency = .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC")
}
