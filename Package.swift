// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "swift-any-sort-comparator",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),
        .macOS(.v12),
        .watchOS(.v8),
        .tvOS(.v14),
    ],
    products: [
        .library(
            name: "AnySortComparator",
            targets: ["AnySortComparator"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AnySortComparator",
            dependencies: []
        ),
        .testTarget(
            name: "AnySortComparatorTests",
            dependencies: ["AnySortComparator"]
        ),
    ]
)
