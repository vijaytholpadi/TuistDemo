//
//  AppDelegate.swift
//  FeaturePlayground
//
//  Created by Vijay Tholpadi on 26/2/24.
//

import Foundation
import Inject
//import Settings
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

//        let viewController = Inject.ViewControllerHost(
//            SettingsView())
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController

        navigationController.setViewControllers([], animated: true)

        // Fixing iOS 15 issue with additional section Padding.
        if #available(iOS 15, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }

        return true
    }
}
