import ProjectDescription

let project = Project(
    name: "SharedModel",
    targets: [
        .target(
            name: "SharedModel",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.TuistDemo.SharedModel",
            infoPlist: .default,
            sources: ["Sources/**"]
        ),
        .target(
            name: "SharedModelTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistDemo.SharedModel.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "SharedModel")
            ]
        ),
    ]
)
