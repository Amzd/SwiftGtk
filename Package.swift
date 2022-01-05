// swift-tools-version:5.5

import PackageDescription

#if os(OSX)
  let cGtkSources = "Sources/CGtk/MacOS"
#elseif os(Linux)
  let cGtkSources = "Sources/CGtk/Linux"
#else
  fatalError("Unsupported platform.")
#endif

let package = Package(
  name:  "SwiftGtk",
  targets: [
    .systemLibrary(
      name: "CGtk",
      path: cGtkSources,
      pkgConfig: "gtk+-3.0", 
      providers: [.brew(["gtk+3"]), 
      .apt(["libgtk-3-dev clang"])]),
    .target(
      name: "SwiftGtk",
      dependencies: ["CGtk"]),
    .executableTarget(
      name: "Demo",
      dependencies: ["SwiftGtk"],
      resources: [.copy("GTK.png")])
  ]
)
