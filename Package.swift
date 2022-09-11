// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "RxPack",
  platforms: [.macOS(.v10_13)],
  products: [
    .library(name: "RxPack", targets: ["RxPack"]),
    .library(name: "MPack", targets: ["MPack"]),
  ],
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.5.0"),
    .package(url: "https://github.com/a2/MessagePack.swift", .upToNextMinor(from: "4.0.0")),
    .package(url: "https://github.com/IBM-Swift/BlueSocket", from: "2.0.2"),
    .package(url: "https://github.com/Quick/Nimble", from: "10.0.0"),
  ],
  targets: [
    .target(name: "RxPack", dependencies: [
      .product(name: "RxSwift", package: "RxSwift"),
      .product(name: "MessagePack", package: "MessagePack.swift"),
      .product(name: "Socket", package: "BlueSocket"),
      "MPack",
    ]),
    .testTarget(name: "RxPackTests", dependencies: [
      "RxPack",
      .product(name: "RxBlocking", package: "RxSwift"),
      .product(name: "RxTest", package: "RxSwift"),
      .product(name: "Nimble", package: "Nimble"),
    ]),
    .target(name: "MPack", dependencies: ["MPackC"]),
    .target(name: "MPackC", dependencies: []),
    .testTarget(name: "MPackTests", dependencies: [
      .product(name: "MessagePack", package: "MessagePack.swift"),
      "MPack",
    ]),
  ]
)
