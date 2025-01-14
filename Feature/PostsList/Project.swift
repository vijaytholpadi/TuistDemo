import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "PostsList",
    targets: [
        .target(
            name: "PostsList",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.TuistDemo.PostList",
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
                .postDetail,
                .external(name: "Alamofire")
            ]
        ),
        .target(
            name: "PostsListTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistDemo.PostsList.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "PostsList")]
        ),
    ]
)

