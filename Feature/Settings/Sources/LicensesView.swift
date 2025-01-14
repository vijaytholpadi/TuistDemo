//
//  LicensesView.swift
//  Settings
//
//  Created by Vijay Tholpadi on 14/1/25.
//

import SwiftUI

struct LicensesView: View {
    let licenses = [
        "SDWebImage": "MIT License",
        "Alamofire": "MIT License",
        "RxSwift": "MIT License",
        "SnapKit": "MIT License",
        "Lottie": "Apache License 2.0",
        "SwiftDate": "MIT License"
    ]
    
    var body: some View {
        List {
            ForEach(licenses.sorted(by: { $0.key < $1.key }), id: \.key) { package, license in
                VStack(alignment: .leading) {
                    Text(package)
                        .font(.headline)
                    Text(license)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Licenses")
    }
}
