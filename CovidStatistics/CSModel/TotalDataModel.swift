//
//  TotalDataModel.swift
//  CSModel
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import Foundation

public struct TotalDataModel {
    public let confirmed: Int
    public let deaths: Int
    public let confirmed_diff: Int
    public let deaths_diff: Int
    public let active: Int
    public let fatality_rate: Double

    public init(confirmed: Int = 0,
                deaths: Int = 0,
                confirmed_diff: Int = 0,
                deaths_diff: Int = 0,
                active: Int = 0,
                fatality_rate: Double = 0.0) {
        self.confirmed = confirmed
        self.deaths = deaths
        self.confirmed_diff = confirmed_diff
        self.deaths_diff = deaths_diff
        self.active = active
        self.fatality_rate = fatality_rate
    }
}
