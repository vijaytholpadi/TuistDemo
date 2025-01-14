import SwiftUI
import SwiftDate
import Lottie

public struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @State private var showingProfilePicker = false
    @State private var showingDatePicker = false

    public init() {}

    public var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    HStack {
                        AsyncImage(url: viewModel.profileImageURL)
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            TextField("Username", text: $viewModel.username)
                            Text(viewModel.lastUpdated.toFormat("Last updated: MMM dd, yyyy"))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .onTapGesture {
                        showingProfilePicker = true
                    }
                }

                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $viewModel.notificationsEnabled)
                    Toggle("Dark Mode", isOn: $viewModel.darkModeEnabled)

                    NavigationLink(destination: NotificationSettingsView()) {
                        Text("Notification Settings")
                    }

                    NavigationLink(destination: PrivacySettingsView()) {
                        Text("Privacy Settings")
                    }
                }

                Section(header: Text("Data & Storage")) {
                    HStack {
                        Text("Cache Size")
                        Spacer()
                        Text(viewModel.cacheSize)
                            .foregroundColor(.gray)
                    }

                    Button("Clear Cache") {
                        viewModel.clearCache()
                    }
                    .foregroundColor(.red)
                }

                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text(viewModel.appVersion)
                            .foregroundColor(.gray)
                    }

                    NavigationLink(destination: LicensesView()) {
                        Text("Licenses")
                    }

                    Button("Rate App") {
                        viewModel.rateApp()
                    }
                }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showingProfilePicker) {
                ImagePicker(imageURL: $viewModel.profileImageURL)
            }
        }
    }
}
