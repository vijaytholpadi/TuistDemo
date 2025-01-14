import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Networking",
    targets: [
        .target(
            name: "Networking",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.TuistDemo.Networking",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .sharedModel,
                .external(name: "Alamofire")
            ]
        ),
        .target(
            name: "NetworkingTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistDemo.Networking.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .sharedModel
            ]
        ),
    ]
)