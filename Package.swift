// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AMRAdapterAdserver",
    platforms: [
        // AdmostAdServer 1.5.0 raised its own minimum to iOS 15, so the adapter
        // cannot stay on 13 however low AMRSDK itself goes.
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMRAdapterAdserver",
            targets: ["AMRAdapterAdserver"]
        )
    ],
    dependencies: [
        // 1.6.2 is the floor: interscroller placements stop entering banner
        // auto-refresh there, and the adapter hands the SDK an interscroller.
        .package(url: "https://github.com/admost/AMR-IOS-SDK.git", from: "1.6.2"),
        // Any 1.6.x, so an AdServer patch release reaches publishers without
        // a new adapter release. A minor bump is a deliberate adapter change.
        .package(url: "https://github.com/admost/AdmostAdServer-iOS.git", .upToNextMinor(from: "1.6.2"))
    ],
    targets: [
        .target(
            name: "AMRAdapterAdserver",
            dependencies: [
                "AMRAdapterAdserverLib",
                .product(name: "AMRSDK", package: "AMR-IOS-SDK"),
                .product(name: "AdmostAdServer", package: "AdmostAdServer-iOS")
            ],
            path: "AMRAdapterAdserver",
            exclude: ["Libs"],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        ),
        .binaryTarget(
            name: "AMRAdapterAdserverLib",
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.6.2/AMRAdapterAdserver.xcframework.zip",
            checksum: "34ec4c1a0b2e1b8cc446d3f2efe92fdafcfc9a4c87467e54c17ed57513423f97"
        )
    ]
)
