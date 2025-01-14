//
//  PostListViewModel.swift
//  PostsList
//
//  Created by Vijay Tholpadi on 14/1/25.
//


import Foundation
import SharedModel
import Networking
import RxSwift
import RxCocoa

class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private let disposeBag = DisposeBag()

    func fetchPosts() async {
        NetworkManager.shared.fetchPosts()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] posts in
                self?.posts = posts
            })
            .disposed(by: disposeBag)
    }
}
