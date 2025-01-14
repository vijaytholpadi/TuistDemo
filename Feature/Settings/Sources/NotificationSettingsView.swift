//
//  NotificationSettingsView.swift
//  Settings
//
//  Created by Vijay Tholpadi on 14/1/25.
//

import SwiftUI

struct NotificationSettingsView: View {
    @State private var pushEnabled = true
    @State private var emailEnabled = true
    @State private var frequency = "Daily"

    var body: some View {
        Form {
            Section(header: Text("Push Notifications")) {
                Toggle("Enable Push", isOn: $pushEnabled)
                if pushEnabled {
                    Picker("Frequency", selection: $frequency) {
                        Text("Daily").tag("Daily")
                        Text("Weekly").tag("Weekly")
                        Text("Monthly").tag("Monthly")
                    }
                }
            }

            Section(header: Text("Email Notifications")) {
                Toggle("Enable Email", isOn: $emailEnabled)
            }
        }
        .navigationTitle("Notifications")
    }
}
