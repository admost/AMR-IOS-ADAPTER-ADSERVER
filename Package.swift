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
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.3.2/AMRAdapterAdserver.xcframework.zip",
            checksum: "dcaa2c13a85680ac87f7dc8cc68413a21d14a5ed5ab0d95617c7663d86548ccb"
        ),
        .binaryTarget(
            name: "AdmostAdServer",
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.3.2/AdmostAdServer.xcframework.zip",
            checksum: "b5fcc802b3c2ad52e885b3f5a849584b201e053d9ecc72cfb54d420cc14b763f"
        )
    ]
)
