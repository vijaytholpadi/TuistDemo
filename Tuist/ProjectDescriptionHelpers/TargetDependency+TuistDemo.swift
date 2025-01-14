import ProjectDescription

extension TargetDependency {
    public static let sharedModel = TargetDependency.project(
        target: "SharedModel",
        path: .relativeToRoot("Core/SharedModel")
    )

    public static let networking = TargetDependency.project(
        target: "Networking",
        path: .relativeToRoot("Capability/Networking")
    )

    public static let postsList = TargetDependency.project(
        target: "PostsList",
        path: .relativeToRoot("Feature/PostsList")
    )

    public static let postDetail = TargetDependency.project(
        target: "PostDetail",
        path: .relativeToRoot("Feature/PostDetail")
    )

    public static let settings = TargetDependency.project(
        target: "Settings",
        path: .relativeToRoot("Feature/Settings")
    )
}
