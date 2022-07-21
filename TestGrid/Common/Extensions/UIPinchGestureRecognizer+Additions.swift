//
//  UIPinchGestureRecognizer+Additions.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 18.07.2022.
//

import UIKit

public extension UIPinchGestureRecognizer {

  var orientation: Orientation {
    if numberOfTouches < 2 {

      return .unsupported
    }

    let A = location(ofTouch: 0, in: view)
    let B = location(ofTouch: 1, in: view)

    return getOrientation(pointA: A, pointB: B)
  }
}
