import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Settings",
    targets: [
        .target(
            name: "Settings",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.TuistDemo.Settings",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .sharedModel,
                .networking,
                .postDetail,
                .external(name: "Alamofire")
            ]
        ),
        .target(
            name: "SettingsTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistDemo.Settings.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "Settings")]
        ),
    ]
)

