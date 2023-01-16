//
//  CovidStatisticsUITestsLaunchTests.swift
//  CovidStatisticsUITests
//
//  Created by Yusuke Miyanaga on 2022/12/29.
//

import XCTest

final class CovidStatisticsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
        XCTAssertTrue(app.staticTexts["世界の総数"].exists)
        XCTAssertTrue(app.staticTexts["総感染者数"].exists)
        XCTAssertTrue(app.staticTexts["1日の感染者数"].exists)
        XCTAssertTrue(app.staticTexts["死亡率"].exists)
    }
}
