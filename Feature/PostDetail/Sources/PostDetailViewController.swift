import UIKit
import SwiftUI
import SharedModel
import Networking
import SnapKit
import RxSwift
import RxCocoa
import Charts

public class PostDetailViewController: UIViewController {
    private let post: Post
    private let viewModel: PostDetailViewModel
    private let disposeBag = DisposeBag()

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    private let userInfoView = UserInfoView()
    private let statsView = StatsView()

    public init(post: Post) {
        self.post = post
        self.viewModel = PostDetailViewModel(post: post)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        [imageView, titleLabel, userInfoView, bodyLabel, statsView].forEach { view in
            contentView.addSubview(view)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        statsView.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }

        titleLabel.text = post.title
        bodyLabel.text = post.body
        statsView.configure(with: post)
    }

    private func bindViewModel() {
        viewModel.user
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
                self?.userInfoView.configure(with: user)
            })
            .disposed(by: disposeBag)
    }
}

//#Preview(body: {
//    PostDetailViewController(
//        post: Post(id: 1,
//                   title: "This is a really cool post",
//                   body: "World",
//                   userId: 1)
//    )
//})
