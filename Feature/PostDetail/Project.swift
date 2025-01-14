import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "PostDetail",
    targets: [
        .target(
            name: "PostDetail",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.TuistDemo.PostDetail",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .sharedModel,
                .networking,
                .external(name: "Alamofire")
            ]
        ),
        .target(
            name: "PostDetailTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistDemo.PostDetail.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "PostDetail")]
        ),
    ]
)
