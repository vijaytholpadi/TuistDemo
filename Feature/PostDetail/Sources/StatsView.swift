//
//  StatsView.swift
//  PostDetail
//
//  Created by Vijay Tholpadi on 14/1/25.
//


import UIKit
import SnapKit
import Charts
import SharedModel

class StatsView: UIView {
    private let chartView: LineChartView = {
        let chart = LineChartView()
        chart.rightAxis.enabled = false
        chart.legend.enabled = true
        chart.xAxis.labelPosition = .bottom
        return chart
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let commentsLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [chartView, likesLabel, commentsLabel].forEach { addSubview($0) }
        
        chartView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        likesLabel.snp.makeConstraints { make in
            make.top.equalTo(chartView.snp.bottom).offset(16)
            make.leading.equalToSuperview()
        }
        
        commentsLabel.snp.makeConstraints { make in
            make.top.equalTo(likesLabel)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(with post: Post) {
        likesLabel.text = "❤️ \(post.likes) likes"
        commentsLabel.text = "💬 \(post.comments) comments"
        
        // Setup chart data here...
    }
}
