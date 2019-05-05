//
//  XCUIElementExtension.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 02/09/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import XCTest

extension XCUIElement {
  
  /// Validates the existence of the element
  func validate(_ failureMessage: String = "", timeout: Double = 2) {
    XCTAssertTrue(self.waitForExistence(timeout: timeout), failureMessage + " - Could not find \(self.description) element.")
  }
  
  func forceTap() {
    // There appears to be a bug with tapping elements sometimes, despite them being on-screen and tappable, due to hittable being false.
    // See: http://stackoverflow.com/a/33534187/1248491
    if self.isHittable {
      self.tap()
    } else {
      coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
    }
  }
  
  // Check if two elements are on the same horizontal line
  func isInlineWith(_ element: XCUIElement, maxThresholdVerticaLimit: CGFloat = 5.0) -> Bool {
    if self.waitForExistence(timeout: 2) {
      return abs(self.frame.origin.y - element.frame.origin.y) < maxThresholdVerticaLimit
    }
    return false
  }
}
