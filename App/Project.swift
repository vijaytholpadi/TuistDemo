import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TuistDemo",
    targets: [
        .target(
            name: "TuistDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistDemo",
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
                .postsList,
                .postDetail,
                .settings,
                .external(name: "Alamofire"),
                .external(name: "SnapKit"),
                .external(name: "RxSwift"),
                .external(name: "Lottie"),
                .external(name: "SwiftDate"),
                .external(name: "Charts")
            ]
        ),
        .target(
            name: "TuistDemoTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistDemoTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "TuistDemo")]
        ),
    ]
)
