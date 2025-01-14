//
//  Post.swift
//  TuistDemo
//
//  Created by Vijay Tholpadi on 14/1/25.
//

public struct Post: Codable, Identifiable {
    public let id: Int
    public let title: String
    public let body: String
    public let userId: Int

    public init(id: Int, title: String, body: String, userId: Int) {
        self.id = id
        self.title = title
        self.body = body
        self.userId = userId
    }
}
