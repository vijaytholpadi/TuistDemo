import SwiftUI
import SharedModel

public struct PostDetailView: UIViewControllerRepresentable {
    let post: Post

    public init(post: Post) {
        self.post = post
    }

    public func makeUIViewController(context: Context) -> PostDetailViewController {
        return PostDetailViewController(post: post)
    }

    public func updateUIViewController(_ uiViewController: PostDetailViewController, context: Context) {}
}
