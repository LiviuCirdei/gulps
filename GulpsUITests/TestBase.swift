//
//  TestBase.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 25/08/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import Foundation
import XCTest

class TestBase: XCTestCase {
  let app = XCUIApplication()
  let springApp = XCUIApplication(bundleIdentifier: "com.apple.springboard")
  var screens: Screens!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app.launch()
    // initilize all screens
    screens = Screens()
  }
  
  override func tearDown() {
    deleteApp()
    super.tearDown()
  }
  
  func deleteApp() {
    app.terminate()
    let icon = springApp.icons[AccessibilityLabels.gulps]
    let deleteButton = icon.buttons[AccessibilityLabels.deleteBtn]
    let deleteBtnOnAlert = springApp.alerts.buttons[AccessibilityLabels.delete]
    icon.press(forDuration: 1.5)
    WaitUtil.waitForElementToBeHittable(deleteButton).tap()
    WaitUtil.waitForElementToBeHittable(deleteBtnOnAlert).tap()
    XCUIDevice.shared.press(.home)
  }
}
