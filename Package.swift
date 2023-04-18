// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "test",
  platforms: [
    .macOS(.v10_15),
  ],
  products: [
  ],
  dependencies: [
  ],
  targets: [
    // MARK: Executables

    .target(
      name: "BeRich",
      path: "BeRich/PatternDetector"
    ),

    // MARK: Tests

    .testTarget(
      name: "BeRichTests",
      dependencies: [
        "BeRich",
      ],
      path: "BeRichTests",
      resources: [
        .process("sber.csv"),
      ]
    ),
  ]
)
