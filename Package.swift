// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "SwiftMacros",
  platforms: [
    .iOS(.v13),
    .macOS(.v11),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "SwiftMacros",
      targets: [
        "SwiftMacros"
      ]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.1")
  ],
  targets: [
    .macro(
      name: "Macros",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
      ]
    ),
    .target(
      name: "SwiftMacros",
      dependencies: [
        "Macros"
      ]
    ),
    .testTarget(
      name: "MacroTests",
      dependencies: [
        "Macros",
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")
      ]
    )
  ]
)
