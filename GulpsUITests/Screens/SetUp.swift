//
//  SetUp.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 25/08/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import XCTest

class SetUp: ScreenBase {
  lazy var hiThereLabel = app.staticTexts[AccessibilityLabels.hiThere]
  lazy var appDescriptionLabel = app.staticTexts[AccessibilityLabels.helpMessage]
  lazy var nextBtn = app.buttons[AccessibilityLabels.nextButton]
  lazy var coupleOfQuestionsLabel = app.staticTexts[AccessibilityLabels.coupleOfQuestions]
  lazy var litersButton = app.otherElements.staticTexts[AccessibilityLabels.liters]
  lazy var ouncesButton =  app.otherElements.staticTexts[AccessibilityLabels.ounces]
  lazy var blueCheckIcon = app.buttons[AccessibilityLabels.blueCheckIcon]
  lazy var allowNotifications = springApp.alerts.buttons[AccessibilityLabels.allow]
  lazy var enableAppleHealthInfo = app.staticTexts[AccessibilityLabels.enableAppleHealthExportInSettings]

  
  func validateInitialScreen() {
    hiThereLabel.validate("Not on initial screen.")
  }
  
// There are a few screens/pages that are nothing more that setup screens. Use this method to navigate to a different setup screen
func navigateToSetupScreen(withElement element: XCUIElement, direction: Direction) {
  while !element.waitForExistence(timeout: 3) {
    app.buttons[direction.rawValue].tap()
  }
  }
  
  func setupAndContinueToHomeScreen() {
    while !blueCheckIcon.waitForExistence(timeout: 2) {
      nextBtn.tap()
    }
    blueCheckIcon.tap()
    WaitUtil.waitForElementToBeHittable(allowNotifications).tap()
    WaitUtil.waitForElementToBeHittable(enableAppleHealthInfo).tap()
  }
  
  func chooseUnitOfMeasure(_ unit: UnitOfMeasure) {
    navigateToSetupScreen(withElement: coupleOfQuestionsLabel , direction: .forward)
    unit == .liters ? litersButton.tap() : ouncesButton.forceTap()
  }
}
