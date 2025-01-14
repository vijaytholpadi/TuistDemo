//
//  PrivacySettingsView.swift
//  Settings
//
//  Created by Vijay Tholpadi on 14/1/25.
//

import SwiftUI

struct PrivacySettingsView: View {
    @State private var locationEnabled = false
    @State private var analyticsEnabled = true
    @State private var personalizationEnabled = true

    var body: some View {
        Form {
            Section(header: Text("Location Services")) {
                Toggle("Enable Location", isOn: $locationEnabled)
            }

            Section(header: Text("Data Collection")) {
                Toggle("Analytics", isOn: $analyticsEnabled)
                Toggle("Personalization", isOn: $personalizationEnabled)
            }
        }
        .navigationTitle("Privacy")
    }
}
