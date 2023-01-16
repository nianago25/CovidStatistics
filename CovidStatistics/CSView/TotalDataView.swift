//
//  TotalDataView.swift
//  CSView
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import SwiftUI
import Foundation

struct TotalDataView: View {
    var confirmed: Int = 0
    var confirmed_diff: Int = 0
    var deaths_diff: Int = 0
    var fatality_rate: Double = 0.0

    var body: some View {

        VStack {
            HStack {
                DataCardView(number: confirmed.formatNumber, name: "総感染者数", color: .accentColor)
                    .accessibilityIdentifier("総感染者数")
                DataCardView(number: confirmed_diff.formatNumber, name: "1日の感染者数", color: .accentColor)
                    .accessibilityIdentifier("1日の感染者数")
            }
            HStack {
                DataCardView(number: deaths_diff.formatNumber, name: "死亡数", color: .red)
                    .accessibilityIdentifier("死亡数")
                DataCardView(number: String(format: "%.2f", fatality_rate),
                             name: "死亡率 %",
                             color: .red)
                .accessibilityIdentifier("死亡率")
            }
        }
        .frame(height: 170)
        .padding(10)
    }
}

extension Int {
    var formatNumber: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}
