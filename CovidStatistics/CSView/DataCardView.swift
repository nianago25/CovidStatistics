//
//  DataCardView.swift
//  CSView
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import SwiftUI

struct DataCardView: View {

    var number: String = "--"
    var name: String = " Error"
    var color: Color = .primary

    var body: some View {
        // MARK: - geometryでサイズ変更にも対応。
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color)

                Text(self.name)
                    .font(.body)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(.white)
            .cornerRadius(8.0)
        }
    }
}
