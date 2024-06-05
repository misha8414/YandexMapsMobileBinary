// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapsMobileBinary",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "YandexMapsMobileBinary",
            type: .static,
            targets: ["YandexMapsMobileBinary"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://github.com/PanchenkoVV/YandexMapsMobileBinary/releases/download/4.3.2/YandexMapsMobile.xcframework.zip",
            checksum: "7bedd363d78d48e9c5d32e57b0ae3489bdeee905bfe387ce559ba7bf0a2cbe9c"
        ),
        .target(
            name: "YandexMapsMobileBinary",
            dependencies: [
                "YandexMapsMobile"
            ],
            resources: [
                .process("Resources/YandexMapsMobile.bundle"),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("CoreGraphics"),
                .linkedLibrary("resolv"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .testTarget(
            name: "YandexMapsMobileBinaryTests",
            dependencies: ["YandexMapsMobileBinary"]),
    ]
)
