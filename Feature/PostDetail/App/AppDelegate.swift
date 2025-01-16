//
//  AppDelegate.swift
//  FeaturePlayground
//
//  Created by Vijay Tholpadi on 26/2/24.
//

import Foundation
import Inject
import PostDetail
import SharedModel
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let post = Post(title: "This is PreviewApp post",
                        body: "This is to demo that it can render long text. ",
                        userId: 44,
                        createdAt: Date.now,
                        comments: 5)
        let viewController = Inject.ViewControllerHost(
            PostDetailViewController(post: post))
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController

        navigationController.setViewControllers([viewController], animated: true)

        // Fixing iOS 15 issue with additional section Padding.
        if #available(iOS 15, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }

        return true
    }
}
