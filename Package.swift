// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AMRAdapterAdserver",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AMRAdapterAdserver",
            targets: ["AMRAdapterAdserver"]
        ),
        // AdmostAdServer.framework is dynamic, and EDM4U attaches Swift package
        // products to UnityFramework only, with no Embed & Sign phase. Reached
        // just through AMRAdapterAdserver it never lands in the .app and the
        // player dies at launch with "dyld: Library not loaded". Exposing it as
        // its own product lets a Unity project attach it to the app target too.
        .library(
            name: "AdmostAdServer",
            targets: ["AdmostAdServer"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/admost/AMR-IOS-SDK.git", from: "1.5.84")
    ],
    targets: [
        .target(
            name: "AMRAdapterAdserver",
            dependencies: [
                "AMRAdapterAdserverLib",
                "AdmostAdServer",
                .product(name: "AMRSDK", package: "AMR-IOS-SDK")
            ],
            path: "AMRAdapterAdserver",
            exclude: ["Libs"],
            resources: [
                .copy("Resources/AdmostAdServerResources.bundle")
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        ),
        .binaryTarget(
            name: "AMRAdapterAdserverLib",
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.3.5/AMRAdapterAdserver.xcframework.zip",
            checksum: "689bd80e1dde46b7cb942f173b47fba9aef24cdb42cdb25e9194a27323541b4b"
        ),
        .binaryTarget(
            name: "AdmostAdServer",
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.3.5/AdmostAdServer.xcframework.zip",
            checksum: "e5c6c785f2d6098b943feac979eab4682c70ca5d59fdd7eb1388507dadb9116b"
        )
    ]
)
