//
//  SetupTests.swift
//  SetupTests
//
//  Created by Liviu Cirdei on 25/08/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import XCTest

class SetupTests: TestBase {
  
    func testInitialScreenDisplay() {
      // validate initial screen -"Hi there!" label exists
      screens.setUp.validateInitialScreen()
      
      // validate description exists
      screens.setUp.appDescriptionLabel.validate("Description not found.")
      
      // verify only "next" button exists
      screens.setUp.nextBtn.validate()
      XCTAssertEqual(app.buttons.count, 1, "There should be only one button on initial screen.")
    }
  
  func testNavigateToHomeWithDefaultSetup() {
    // Go to Home screen using default values for the setup
    screens.setUp.setupAndContinueToHomeScreen()
    screens.home.validateScreen()
  }
  
  func testChooseUnitOfMeasure() {
    // choose unit of measure
    screens.setUp.chooseUnitOfMeasure(.ounces)
    
    // continue to Home screen using default values for the rest of setup
    screens.setUp.setupAndContinueToHomeScreen()
    screens.home.validateScreen()
    
    // go to Preferences and validate "Ounces" is selected
    screens.home.goTo(screens.preferences)
    screens.preferences.verifyUnitOfMeasureSelected(unit: .ounces)
    
    // Go to preferences blue screen and change unit of measure to liters
    screens.preferences.tapUnitOfMeasure()
    screens.preferences.changeUnitOfMeasure(.liters)
    screens.preferences.verifyUnitOfMeasureSelected(unit: .liters)
  }
    
}
