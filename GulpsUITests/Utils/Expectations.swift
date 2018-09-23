//
//  Expectations.swift
//  GulpsUITests
//
//  Created by Liviu Cirdei on 22/09/2018.
//  Copyright © 2018 Fancy Pixel. All rights reserved.
//

import Foundation
import XCTest

extension XCTestExpectation {
  // expectations using XCTKVOExpectation
  static func elementToExists(_ element: XCUIElement) -> XCTestExpectation {
    let expectation = XCTKVOExpectation(keyPath: "exists", object: element, expectedValue: true)
    return expectation
  }
  
  static func elementToNotExists(_ element: XCUIElement) -> XCTestExpectation {
    let expectation = XCTKVOExpectation(keyPath: "exists", object: element, expectedValue: false)
    return expectation
  }
  
  // expectation using XCTNSPredicateExpectation
  static func elementToBeHittable(_ element: XCUIElement) -> XCTestExpectation {
    let predicate = NSPredicate(format: "isHittable = true")
    let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
    return expectation
  }
}
