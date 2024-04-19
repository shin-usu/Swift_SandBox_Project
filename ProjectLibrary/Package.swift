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
    ],
    targets: [
        .target(
            name: "AppFeature"),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                "AppFeature",
                .snapshotTesting,
                .snapshotTestingHeic,
            ]),
    ]
)

extension Target.Dependency {
    static let snapshotTesting: Target.Dependency = .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
    static let snapshotTestingHeic: Target.Dependency = .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC")
}
