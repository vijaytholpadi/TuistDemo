//
//  SettingsViewModel.swift
//  Settings
//
//  Created by Vijay Tholpadi on 14/1/25.
//


import Foundation
import SwiftDate

class SettingsViewModel: ObservableObject {
    @Published var username: String = UserDefaults.standard.string(forKey: "username") ?? ""
    @Published var notificationsEnabled: Bool = UserDefaults.standard.bool(forKey: "notifications")
    @Published var darkModeEnabled: Bool = UserDefaults.standard.bool(forKey: "darkMode")
    @Published var profileImageURL: URL? = URL(string: UserDefaults.standard.string(forKey: "profileImage") ?? "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI")
    
    var lastUpdated: Date = Date()
    var cacheSize: String = "1.2 GB"
    var appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    
    func clearCache() {
        // Implementation for clearing cache
    }
    
    func rateApp() {
        // Implementation for rating app
    }
}

extension SettingsViewModel {
    func saveProfileImage(url: URL) {
        UserDefaults.standard.set(url.absoluteString, forKey: "profileImage")
        self.profileImageURL = url
        self.lastUpdated = Date()
    }
}
