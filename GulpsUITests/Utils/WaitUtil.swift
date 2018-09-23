//
//  WaitUtil.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 21/09/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import Foundation
import XCTest

class WaitUtil {
  
  static func waitFor(_ expectation: XCTestExpectation, timeout: TimeInterval = 3.0) {
    let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
    if result != .completed {
      XCTFail("Expected condition \(expectation) was not completed after waiting for \(timeout) seconds!")
    }
  }
  
  @discardableResult
  static func waitForElementToBeHittable(_ element: XCUIElement) -> XCUIElement {
    waitFor(.elementToBeHittable(element))
    return element
  }
}
