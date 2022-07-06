//
//  Timer_Login_UserDefaults_Combine_SwiftUI_HW_3_3UITestsLaunchTests.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3UITests
//
//  Created by  Sergey Yurtaev on 06.07.2022.
//

import XCTest

class Timer_Login_UserDefaults_Combine_SwiftUI_HW_3_3UITestsLaunchTests: XCTestCase {

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

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
