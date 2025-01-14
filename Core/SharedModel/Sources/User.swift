//
//  User.swift
//  SharedModel
//
//  Created by Vijay Tholpadi on 14/1/25.
//

import Foundation
public struct User: Codable, Identifiable {
    public let id: Int
    public let name: String
    public let email: String
    
    public init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
