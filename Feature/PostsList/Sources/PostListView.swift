import SwiftUI
import SharedModel
import Networking
import PostDetail

public struct PostListView: View {
    @State private var posts: [Post] = []

    public init() {}

    public var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                NetworkManager.shared.fetchPosts { fetchedPosts in
                    posts = fetchedPosts
                }
            }
        }
    }
}
