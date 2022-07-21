//
//  TestGridUITests.swift
//  TestGridUITests
//
//  Created by Illya Kuznietsov on 20.07.2022.
//

import XCTest

class TestGridUITests: XCTestCase {
  var app: XCUIApplication!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }
  
  func testPinchScaleIn() throws {
    let collectionViewsQuery = XCUIApplication().collectionViews
    let cell = collectionViewsQuery.cells.element(boundBy: 0)
    let initialWidth = cell.frame.width
    let initialHeight = cell.frame.height
    cell.pinch(withScale: 2, velocity: 1)
    sleep(1)
    XCTAssertGreaterThan(cell.frame.width, initialWidth)
    XCTAssertGreaterThan(cell.frame.height, initialHeight)
  }
  
  func testPinchScaleOut() throws {
    let collectionViewsQuery = XCUIApplication().collectionViews
    let cell = collectionViewsQuery.cells.element(boundBy: 0)
    let initialWidth = cell.frame.width
    let initialHeight = cell.frame.height
    cell.pinch(withScale: 0.5, velocity: -1)
    sleep(1)
    XCTAssertLessThan(cell.frame.width, initialWidth)
    XCTAssertLessThan(cell.frame.height, initialHeight)
  }
  
  func testTapScaleIn() throws {
    let collectionViewsQuery = XCUIApplication().collectionViews
    let cell = collectionViewsQuery.cells.element(boundBy: 0)
    let initialWidth = cell.frame.width
    let initialHeight = cell.frame.height
    cell.tap(withNumberOfTaps: 1, numberOfTouches: 1)
    sleep(1)
    XCTAssertGreaterThan(cell.frame.width, initialWidth)
    XCTAssertGreaterThan(cell.frame.height, initialHeight)
  }
  
  func testTapScaleOut() throws {
    let collectionViewsQuery = XCUIApplication().collectionViews
    let cell = collectionViewsQuery.cells.element(boundBy: 0)
    let initialWidth = cell.frame.width
    let initialHeight = cell.frame.height
    cell.tap(withNumberOfTaps: 2, numberOfTouches: 1)
    sleep(1)
    XCTAssertLessThan(cell.frame.width, initialWidth)
    XCTAssertLessThan(cell.frame.height, initialHeight)
  }
}
