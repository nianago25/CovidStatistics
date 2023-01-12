//
//  TotalDataEntity.swift
//  CSAPIServer
//
//  Created by Yusuke Miyanaga on 2023/01/05.
//

import Foundation

public struct TotalDataEntity: Decodable {
    public let data: TotalData
}

public struct TotalData: Codable {
    public let confirmed: Int
    public let deaths: Int
    public let confirmed_diff: Int
    public let deaths_diff: Int
    public let active: Int
    public let fatality_rate: Double
}
