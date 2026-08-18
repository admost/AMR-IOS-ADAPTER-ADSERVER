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
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.4.0/AMRAdapterAdserver.xcframework.zip",
            checksum: "465190bfb83ad44127651dfa282b7f7689de9d29c13683a31256fea4c732c4d8"
        ),
        .binaryTarget(
            name: "AdmostAdServer",
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.4.0/AdmostAdServer.xcframework.zip",
            checksum: "b97936c48074d6d8c9ea104dcdb1bc20ee647c8cca6a23fd695dff949f185e8a"
        )
    ]
)
