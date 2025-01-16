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
            deploymentTargets: Project.minDeploymentVersion,
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .sharedModel,
                .external(name: "Alamofire"),
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
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
