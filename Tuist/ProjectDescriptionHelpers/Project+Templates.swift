import ProjectDescription

extension Project {

    public static let destinations: ProjectDescription.Destinations = [.iPhone]

    public static let minDeploymentVersion: DeploymentTargets = .iOS("18.0")

    public static func resolvedProductType() -> ProjectDescription.Product {
        if Environment.isDynamic.getBoolean(default: false) {
            return .framework
        } else {
            return .staticFramework
        }
    }

    public static func featureFramework(
        name: String,
        dependencies: [TargetDependency] = []) -> Project {
            return Project(
                name: name,
                options: .options(
                    disableSynthesizedResourceAccessors: true
                ),
                targets: [
                    frameworkTarget(
                        name: name,
                        dependencies: dependencies + featureTargetDependencies),
                    testTarget(
                        name: name
                    )
                ]
            )
        }

    public static func featureFrameworkWithApp(
        name: String,
        dependencies: [TargetDependency] = []) -> Project {
            return Project(
                name: name,
                options: .options(
                    disableSynthesizedResourceAccessors: true
                ),
                targets: [
                    frameworkTarget(
                        name: name,
                        dependencies: dependencies + featureTargetDependencies
                    ),
                    applicationTarget(
                        name: name,
                        dependencies: dependencies + featureTargetDependencies
                    ),
                    testTarget(
                        name: name
                    )
                ]
            )
        }

    static func frameworkTarget(
        name: String,
        dependencies: [TargetDependency] = []) -> Target {
            return .target(
                name: name,
                destinations: Project.destinations,
                product: resolvedProductType(),
                bundleId: "io.tuist.TuistDemo.\(name)",
                deploymentTargets: Project.minDeploymentVersion,
                sources: [
                    "Sources/**"
                ],
                resources: [
                    "Resources/**"
                ],
                dependencies: dependencies)
        }

    static func applicationTarget(
        name: String,
        dependencies: [TargetDependency] = []) -> Target {
            .target(
                name: "\(name)App",
                destinations: Project.destinations,
                product: .app,
                bundleId: "io.tuist.TuistDemo.\(name)App",
                deploymentTargets: Project.minDeploymentVersion,
                infoPlist: .extendingDefault(
                    with: [
                        "UILaunchScreen": [
                            "UIColorName": "",
                            "UIImageName": "",
                        ],
                    ]
                ),
                sources: [
                    "App/**"
                ],
                resources: [
                    "../../App/Resources/**"
                ],
                dependencies: [
                    .target(
                        name: name
                    ),
                    .external(
                        name: "Inject"
                    )
                ] + appDependencies
            )
        }

    static func testTarget(
        name: String) -> Target {
            .target(
                name: "\(name)Tests",
                destinations: Project.destinations,
                product: .unitTests,
                bundleId: "io.tuist.TuistDemo.\(name)Tests",
                sources: [
                    "Tests/**"
                ],
                dependencies: [
                    .target(
                        name: name
                    )
                ]
            )
        }

    // For use with Feature Modules
    static var featureTargetDependencies: [TargetDependency] {
        [
            .sharedModel,
            .networking,
            .external(name: "Alamofire"),
            .external(name: "Lottie"),
            .external(name: "Charts"),
            .external(name: "RxSwift"),
            .external(name: "RxCocoa")
        ]
    }

    // For use with TuistDemo Workspace
    public static var appDependencies: [TargetDependency] {
        [
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
    }
}
