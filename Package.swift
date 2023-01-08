// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Kinzoku",
    platforms: [ .macOS(.v13) ], // I don't think we need to specify Linux
    products: [
        .library(
            name: "Kinzoku",
            targets: [ "Kinzoku" ]),
    ],
    dependencies: [],
    targets: [
        .systemLibrary(
            name: "Wgpu"
        ),
        .target(
            name: "Kinzoku",
            dependencies: [ "Wgpu" ],
            linkerSettings: [
                .unsafeFlags([
                    "-L\(Context.packageDirectory)/Sources/Wgpu/macos/arm64"
                ])
            ]
        ),
        .testTarget(
            name: "KinzokuTests",
            dependencies: [ "Kinzoku" ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
