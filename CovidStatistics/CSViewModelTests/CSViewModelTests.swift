//
//  CSViewModelTests.swift
//  CSViewModelTests
//
//  Created by Yusuke Miyanaga on 2022/12/29.
//

import XCTest
@testable import CSViewModel
@testable import CSModel
@testable import CSAPIServer

final class CSViewModelTests: XCTestCase {

    var viewModel = MainViewModel(apiService: APIService())
    let apiServerMock = APIServiceProtocolMock()

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_totalData() throws {
        XCTAssertEqual(viewModel.totalData.confirmed, TotalDataModel().confirmed)
        XCTAssertEqual(viewModel.totalData.deaths, TotalDataModel().deaths)
        XCTAssertEqual(viewModel.totalData.confirmed_diff, TotalDataModel().confirmed_diff)
        XCTAssertEqual(viewModel.totalData.deaths_diff, TotalDataModel().deaths_diff)
        XCTAssertEqual(viewModel.totalData.active, TotalDataModel().active)
        XCTAssertEqual(viewModel.totalData.fatality_rate, TotalDataModel().fatality_rate)
    }

    func test_setTotalData() async throws {
        apiServerMock.fetchTotalDataHandler = { TotalDataEntity(data: TotalData(confirmed: 0,
                                                                                deaths: 0,
                                                                                confirmed_diff: 0,
                                                                                deaths_diff: 0,
                                                                                active: 0,
                                                                                fatality_rate: 0.0))}
        viewModel = MainViewModel(apiService: apiServerMock)
        await viewModel.setTotalData()
        XCTAssertEqual(apiServerMock.fetchTotalDataCallCount, 1)
    }

}
