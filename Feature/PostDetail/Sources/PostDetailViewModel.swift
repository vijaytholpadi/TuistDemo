//
//  PostDetailViewModel.swift
//  PostDetail
//
//  Created by Vijay Tholpadi on 14/1/25.
//


import Foundation
import SharedModel
import Networking
import RxSwift
import RxCocoa

class PostDetailViewModel {
    private let post: Post
    private let disposeBag = DisposeBag()
    
    let user = PublishSubject<User>()
    
    init(post: Post) {
        self.post = post
        fetchUser()
    }
    
    private func fetchUser() {
        NetworkManager.shared.fetchUser(id: post.userId)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
                self?.user.onNext(user)
            })
            .disposed(by: disposeBag)
    }
}
