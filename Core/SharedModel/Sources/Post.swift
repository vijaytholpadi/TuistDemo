//
//  Post.swift
//  TuistDemo
//
//  Created by Vijay Tholpadi on 14/1/25.
//

import Foundation
import SwiftDate

public struct Post: Codable, Identifiable {
    public let id: UUID = UUID()
    public let title: String
    public let body: String
    public let userId: Int
    public let createdAt: Date?
    public let likes: Int = 2
    public let comments: Int = 3

    public init(title: String, body: String, userId: Int, createdAt: Date, likes: Int = 3, comments: Int) {
        self.title = title
        self.body = body
        self.userId = userId
        self.createdAt = createdAt
    }

    public var formattedDate: String {
        return createdAt?.toFormat("MMM dd, yyyy") ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case title, body, userId
        case createdAt = "created_at"
    }
}
