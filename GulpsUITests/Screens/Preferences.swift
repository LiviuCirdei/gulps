//
//  Preferences.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 18/09/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import Foundation
import XCTest

class Preferences: ScreenBase {
  lazy var preferencesNavBar = app.navigationBars[AccessibilityLabels.preferences]
  lazy var unitOfMeasureLabel = app.staticTexts[AccessibilityLabels.unitOfMesure]
  lazy var ouncesLabel = app.staticTexts[AccessibilityLabels.ounces]
  lazy var litersLabel = app.staticTexts[AccessibilityLabels.liters]
  // Preferences blue screen
  lazy var unitOfMeasure = app.staticTexts[AccessibilityLabels.unitOfMeasureWithColon]

  override func validateScreen() {
    preferencesNavBar.validate("Not on Preferences screen.")
  }
  
  func verifyUnitOfMeasureSelected(unit: UnitOfMeasure) {
    switch unit {
    case .liters:
      XCTAssert(unitOfMeasureLabel.isInlineWith(litersLabel), "Liters is not selected. \(unitOfMeasureLabel) is not inline with \(litersLabel).")
    case .ounces:
      XCTAssert(unitOfMeasureLabel.isInlineWith(ouncesLabel), "Ounces is not selected. \(unitOfMeasureLabel) is not inline with \(ouncesLabel).")
    }
  }
  
  func tapUnitOfMeasure() {
    unitOfMeasureLabel.tap()
  }
}

// MARK: - Preferences blue screen
extension Preferences {
  func changeUnitOfMeasure(_ unit: UnitOfMeasure ) {
    unit == .liters ? litersLabel.tap() : ouncesLabel.tap()
    WaitUtil.waitFor(.elementToNotExists(unitOfMeasure))
  }
}
