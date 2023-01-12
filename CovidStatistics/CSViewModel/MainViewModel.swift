//
//  MainViewModel.swift
//  CSViewModel
//
//  Created by Yusuke Miyanaga on 2022/12/30.
//

import Foundation
import CSModel
import CSAPIServer

public protocol MainViewModelProtocol: ObservableObject {
    var totalData: TotalDataModel { get }
    func setTotalData() async
}

public class MainViewModel: MainViewModelProtocol {

    @Published public var totalData: TotalDataModel = TotalDataModel()
    var apiService: APIServiceProtocol = APIService.shared

    public init() {}

    @MainActor
    public func setTotalData() async {
        guard let response = await fetchTotalData() else { return }
        totalData = response
    }

    func fetchTotalData() async -> TotalDataModel? {
        do {
            let response = try await apiService.fetchTotalData()
            return TotalDataModel(confirmed: response.data.confirmed,
                                  deaths: response.data.deaths,
                                  confirmed_diff: response.data.confirmed_diff,
                                  deaths_diff: response.data.deaths_diff,
                                  active: response.data.active,
                                  fatality_rate: response.data.fatality_rate)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
