//
//  MainView.swift
//  CSView
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import SwiftUI
import CSViewModel

@MainActor
public struct MainView<ViewModel: MainViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel
    let formatter = DateFormatter()
    let today: String

    public init(viewModel: ViewModel) {
        _viewModel = .init(initialValue: viewModel)
        formatter.dateFormat = "y-MM-dd"
        self.today = formatter.string(from: Date())
    }

    public var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(colors: [
                Color(red: 0.76, green: 0.15, blue: 0.26),
                Color(red: 0.01, green: 0.23, blue: 0.5)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                Text("世界の総数:(\(today))")
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                    .padding(10)
                    .accessibilityIdentifier("世界の総数")
                TotalDataView(confirmed: viewModel.totalData.confirmed,
                              confirmed_diff: viewModel.totalData.confirmed_diff,
                              deaths_diff: viewModel.totalData.deaths_diff,
                              fatality_rate: viewModel.totalData.fatality_rate)
            }
            .task({ await viewModel.setTotalData() })
        }
    }
}
