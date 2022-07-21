//
//  TestGridTests.swift
//  TestGridTests
//
//  Created by Illya Kuznietsov on 21.07.2022.
//

import XCTest

@testable import TestGrid

class TestGridTests: XCTestCase {

  //We should test basicaly presenters, but there is no much to test.

  func testHorisontalOrientation() throws {
    let A = CGPoint(x: 0, y: 0)
    let B = CGPoint(x: 5, y: 0)
    let orientation = getOrientation(pointA: A, pointB: B)
    XCTAssertEqual(Orientation.horisontal, orientation)
  }
  
  func testVerticalOrientation() throws {
    let A = CGPoint(x: 0, y: 0)
    let B = CGPoint(x: 0, y: 5)
    let orientation = getOrientation(pointA: A, pointB: B)
    XCTAssertEqual(Orientation.vertical, orientation)
  }
  
  func testDiagonalOrientation() throws {
    let A = CGPoint(x: 5, y: 0)
    let B = CGPoint(x: 0, y: 5)
    let orientation = getOrientation(pointA: A, pointB: B)
    XCTAssertEqual(Orientation.diagonal, orientation)
  }
}
