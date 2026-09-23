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
        // 1.6.3 is the floor: earlier builds ship a privacy manifest that App
        // Store Connect rejects with ITMS-91064.
        .package(url: "https://github.com/admost/AdmostAdServer-iOS.git", .upToNextMinor(from: "1.6.3"))
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
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.6.3/AMRAdapterAdserver.xcframework.zip",
            checksum: "9edd40ebf156932e9e954dae3439bb2875a283c25df660e6800d7bc88ed93c93"
        )
    ]
)
