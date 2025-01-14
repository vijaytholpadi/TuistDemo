import Foundation
import Alamofire
import SharedModel

public class NetworkManager {
    public static let shared = NetworkManager()

    private init() {}

    public func fetchPosts(completion: @escaping ([Post]) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/posts")
            .responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let posts):
                    completion(posts)
                case .failure:
                    completion([])
                }
            }
    }
}
