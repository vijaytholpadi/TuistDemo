// Workspace.swift
import ProjectDescription

let workspace = Workspace(
    name: "TuistDemo",
    projects: [
        "App",
        "Core/SharedModel",
        "Capability/Networking",
        "Feature/PostsList",
        "Feature/PostDetail",
        "Feature/Settings"
    ]
)
