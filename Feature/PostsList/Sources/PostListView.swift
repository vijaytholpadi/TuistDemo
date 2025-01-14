import SwiftUI
import SharedModel
import Networking
import PostDetail
import Charts
import Lottie
import RxSwift

public struct PostListView: View {
    @StateObject private var viewModel = PostListViewModel()
    @State private var showLoadingAnimation = true

    public init() {}

    public var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.posts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            PostRowView(post: post)
                        }
                    }
                }
                .navigationTitle("Posts")
                .refreshable {
                    await viewModel.fetchPosts()
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchPosts()
                    withAnimation {
                        showLoadingAnimation = false
                    }
                }
            }
        }
    }
}

// Separate file: StatsView.swift
struct StatsView: View {
    let posts: [Post]
    private let chartView = BarChartView()

    var body: some View {
        BarChartViewRepresentable(chartView: chartView, posts: posts)
    }
}

struct BarChartViewRepresentable: UIViewRepresentable {
    let chartView: BarChartView
    let posts: [Post]

    func makeUIView(context: Context) -> BarChartView {
        configureChartView()
        return chartView
    }

    func updateUIView(_ uiView: BarChartView, context: Context) {
        uiView.data = generateChartData()
    }

    private func configureChartView() {
        chartView.rightAxis.enabled = false
        chartView.leftAxis.axisMinimum = 0
        chartView.xAxis.labelPosition = .bottom
        chartView.legend.enabled = true
        chartView.animate(yAxisDuration: 0.5)
        chartView.data = generateChartData()
    }

    private func generateChartData() -> BarChartData {
        let entries = posts.enumerated().map { index, post in
            BarChartDataEntry(x: Double(index), y: Double(post.likes))
        }

        let dataSet = BarChartDataSet(entries: entries, label: "Likes")
        dataSet.colors = [.systemBlue]
        dataSet.valueTextColor = .label

        let data = BarChartData(dataSet: dataSet)
        data.setValueFont(.systemFont(ofSize: 10))

        return data
    }
}
