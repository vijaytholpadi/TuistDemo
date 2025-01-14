// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        productTypes: [
            "Alamofire": Project.productType,
            "SnapKit": Project.productType,
            "RxSwift": Project.productType,
            "Lottie": Project.productType,
            "SwiftDate": Project.productType,
            "Charts": Project.productType
         ]
    )
#endif

let package = Package(
    name: "TuistDemo",
    dependencies: [
        // Add your own dependencies here:
         .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
         .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.0")),
         .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
         .package(url: "https://github.com/airbnb/lottie-ios.git", .upToNextMajor(from: "4.0.0")),
         .package(url: "https://github.com/malcommac/SwiftDate.git", .upToNextMajor(from: "7.0.0")),
         .package(url: "https://github.com/danielgindi/Charts.git", .upToNextMajor(from: "4.0.0"))
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
