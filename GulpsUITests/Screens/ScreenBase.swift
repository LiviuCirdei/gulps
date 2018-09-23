//
//  ScreenBase.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 25/08/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import XCTest

class ScreenBase {
  let app = XCUIApplication()
  let springApp = XCUIApplication(bundleIdentifier: "com.apple.springboard")
  
  // override this on every screen that goes to another screen
  func goTo(_ screen: ScreenBase) {}
  
  // override this for every screen to validate the screen
  func validateScreen() {}
  
  // other common actions for all screens
  func validateAlert(title: String? = nil, body: String? = nil, buttons: [String] = []) {
    let alert = app.alerts.firstMatch
    alert.validate("No alert appears.")
    if let title = title {
      alert.staticTexts[title].validate("'\(title)' title doesn't appear on alert view.")
    }
    if let body = body {
      alert.staticTexts[body].validate("'\(body)' body doesn't appear on alert view.")
    }
    for button in buttons {
      alert.buttons[button].validate("'\(button)' button doesn't appear on alert view.")
    }
  }
  
  func handleAlert(withButton button: String) {
    let alert = app.alerts.firstMatch
    WaitUtil.waitForElementToBeHittable(alert.buttons[button]).tap()
  }
}
