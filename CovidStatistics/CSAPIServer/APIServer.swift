//
//  APIService.swift
//  CSAPIServer
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import Foundation

/// @mockable
public protocol APIServiceProtocol {
    func fetchTotalData() async throws -> TotalDataEntity
}

final public class APIService: APIServiceProtocol {
    public init() {}

    public func fetchTotalData() async throws -> TotalDataEntity {
        do {
            // MARK: - 1.API取得先URLの作成
            let totalURLString = URL(string: L10n.url)!
            let headers = [
                "X-RapidAPI-Host": L10n.xRapidAPIHost,
                "X-RapidAPI-Key": L10n.xRapidAPIKey
            ]
            // MARK: - 2.URLリクエストの作成
            var urlRequest = URLRequest(url: totalURLString)
            urlRequest.httpMethod = "GET"
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.timeoutInterval = TimeInterval(10)
            // MARK: - 3.リクエスト
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            guard let httpStatus = urlResponse as? HTTPURLResponse else {
                throw CovidError.responseError
            }
            // MARK: - 4.ステータスコードによって処理を分ける
            switch httpStatus.statusCode {
            case 200 ..< 400:
                let decorder = JSONDecoder()
                return try decorder.decode(TotalDataEntity.self, from: data)
            case 400...:
                throw CovidError.responseError
            default:
                fatalError()
            }
        } catch {
            throw error
        }
    }
}
