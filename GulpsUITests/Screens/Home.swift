//
//  Home.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 18/09/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import Foundation

class Home: ScreenBase {
  lazy var drinkNavigationBar = app.navigationBars[AccessibilityLabels.drink]
  lazy var preferencesButton = app.buttons[AccessibilityLabels.preferences]
  lazy var plusButton = app.buttons[AccessibilityLabels.plusIcon]
  lazy var smallIconButton = app.buttons[AccessibilityLabels.smallIcon]
  lazy var largeIconButton = app.buttons[AccessibilityLabels.largeIcon]
  lazy var minusButton = app.buttons[AccessibilityLabels.minusIcon]
  
  override func validateScreen() {
    drinkNavigationBar.validate("Not on Home screen.")
  }
  
  override func goTo(_ screen: ScreenBase) {
    switch screen {
    case is Preferences:
      preferencesButton.tap()
    default:
      break
    }
    screen.validateScreen()
  }
  
  func addDrink(size: DrinkSize) {
    plusButton.tap()
    switch size {
    case .small:
      WaitUtil.waitForElementToBeHittable(smallIconButton).tap()
    case .large:
      WaitUtil.waitForElementToBeHittable(largeIconButton).tap()
    }
  }
  
  func removeDrink(confirm: Bool = true, withAlertValidation: Bool = true) {
    minusButton.tap()
    if withAlertValidation {
      validateAlert(title: AccessibilityLabels.undo, body: AccessibilityLabels.undoLatestAction, buttons: ["Yes", "No"])
    }
    if confirm {
      handleAlert(withButton: "Yes")
    } else {
      handleAlert(withButton: "No")
    }
  }
  
  func validatePercentageIs(_ percentage: String) {
    let percentageElement = app.staticTexts[percentage]
    percentageElement.validate()
  }
}
