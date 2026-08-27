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
        .package(url: "https://github.com/admost/AMR-IOS-SDK.git", from: "1.5.84"),
        // Any 1.5.x, so an AdServer patch release reaches publishers without
        // a new adapter release. A minor bump is a deliberate adapter change.
        .package(url: "https://github.com/admost/AdmostAdServer-iOS.git", .upToNextMinor(from: "1.5.0"))
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
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.5.0/AMRAdapterAdserver.xcframework.zip",
            checksum: "b9cf1f00809f23ebb94566aeebfe62649b5db49fab5e4a2346dc40791eff02f2"
        )
    ]
)
