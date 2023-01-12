//
//  CovidStatisticsApp.swift
//  CovidStatistics
//
//  Created by Yusuke Miyanaga on 2022/12/29.
//

import SwiftUI
import CSView
import CSViewModel

@main
struct CovidStatisticsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
