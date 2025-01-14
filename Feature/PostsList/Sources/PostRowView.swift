//
//  PostRowView.swift
//  PostsList
//
//  Created by Vijay Tholpadi on 14/1/25.
//

import SwiftUI
import SharedModel

struct PostRowView: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI"))
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)

            Text(post.title)
                .font(.headline)

            Text(post.body)
                .font(.subheadline)
                .lineLimit(2)

            HStack {
                Label("\(post.likes)", systemImage: "heart.fill")
                    .foregroundColor(.red)
                Label("\(post.comments)", systemImage: "message.fill")
                    .foregroundColor(.blue)
                Spacer()
                Text(post.formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}
