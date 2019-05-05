//
//  DrinkTests.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 23/09/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import XCTest

class DrinkTests: TestBase {
  override func setUp() {
    super.setUp()
    screens.setUp.setupAndContinueToHomeScreen()
  }
  
  func testAddSmallDrink() {
    // add small drink (0.2L)
    screens.home.addDrink(size: .small)
    
    // daily goal is 2L so percentage should be 10%
    screens.home.validatePercentageIs("10%")
  }
  
  func testAddLargeDrink() {
    // add large drink (0.5L)
    screens.home.addDrink(size: .large)
    
    // daily goal is 2L so percentage should be 25%
    screens.home.validatePercentageIs("25%")
  }
  
  func testDeleteDrink() {
    // add small drink (0.2L)
    screens.home.addDrink(size: .small)
    
    // daily goal is 2L so percentage should be 10%
    screens.home.validatePercentageIs("10%")
    
    // remove drink
    screens.home.removeDrink()
    
    // percentage should be 0%
    screens.home.validatePercentageIs("0%")
  }
  
  func testAddSmallAndLargeDrinks() {
    // add small drink (0.2L)
    screens.home.addDrink(size: .small)
    
    // add large drink (0.5L)
    screens.home.addDrink(size: .large)
    
    // daily goal is 2L so percentage should be 35%
    screens.home.validatePercentageIs("35%")
  }
}
