// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "swift-composable-architecture",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "ComposableArchitecture",
      type: .dynamic,
      targets: ["ComposableArchitecture"]
    ),
    .library(
      name: "ComposableCoreLocation",
      type: .dynamic,
      targets: ["ComposableCoreLocation"]
    ),
    .library(
      name: "ComposableCoreMotion",
      type: .dynamic,
      targets: ["ComposableCoreMotion"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/MoralAlberto/combine-schedulers", from: "0.1.0"),
    .package(url: "https://github.com/MoralAlberto/swift-case-paths", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "ComposableArchitecture",
      dependencies: [
        "CasePaths",
        "CombineSchedulers",
      ]
    ),
    .testTarget(
      name: "ComposableArchitectureTests",
      dependencies: [
        "CombineSchedulers",
        "ComposableArchitecture",
      ]
    ),
    .target(
      name: "ComposableCoreLocation",
      dependencies: [
        "ComposableArchitecture"
      ]
    ),
    .testTarget(
      name: "ComposableCoreLocationTests",
      dependencies: [
        "ComposableCoreLocation"
      ]
    ),
    .target(
      name: "ComposableCoreMotion",
      dependencies: [
        "ComposableArchitecture"
      ]
    ),
    .testTarget(
      name: "ComposableCoreMotionTests",
      dependencies: [
        "ComposableCoreMotion"
      ]
    ),
  ]
)
