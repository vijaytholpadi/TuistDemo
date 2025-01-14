import Foundation
import Alamofire
import SharedModel
import RxSwift
import RxCocoa

public class NetworkManager {
    public static let shared = NetworkManager()

    private init() {}

    public func fetchPosts() -> Observable<[Post]> {
        return Observable.create { observer in
            AF.request("https://jsonplaceholder.typicode.com/posts")
                .responseDecodable(of: [Post].self) { response in
                    switch response.result {
                    case .success(let posts):
                        observer.onNext(posts)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }

    public func fetchUser(id: Int) -> Observable<User> {
        return Observable.create { observer in
            AF.request("https://jsonplaceholder.typicode.com/users/\(id)")
                .responseDecodable(of: User.self) { response in
                    switch response.result {
                    case .success(let user):
                        observer.onNext(user)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
