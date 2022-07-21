//
//  Orientation.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 21.07.2022.
//

import UIKit

public enum Orientation {
  case horisontal
  case vertical
  case diagonal
  case unsupported
}

func getOrientation(pointA: CGPoint, pointB: CGPoint) -> Orientation {
  let xD = abs( pointA.x - pointB.x )
  let yD = abs( pointA.y - pointB.y )
  if (xD == 0) { return .vertical }
  if (yD == 0) { return .horisontal }
  let ratio = xD / yD

  if (ratio > 2) { return .horisontal }
  if (ratio < 0.5) { return .vertical }

  return .diagonal
}
