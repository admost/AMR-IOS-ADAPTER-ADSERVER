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
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.2.5/AMRAdapterAdserver.xcframework.zip",
            checksum: "dc2c4208292f314639cf56ff0fffb21c478a633a4ed061f504b58472c858e391"
        ),
        .binaryTarget(
            name: "AdmostAdServer",
            url: "https://github.com/admost/AMR-IOS-ADAPTER-ADSERVER/releases/download/1.2.5/AdmostAdServer.xcframework.zip",
            checksum: "835291508eb44a7a78c368d10334829f6ff94c50dc6a40a6ba96cfe25b22c4c9"
        )
    ]
)
