//
//  Any+Additions.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 18.07.2022.
//

import Foundation

public typealias Callback<T> = (_: T) -> Void

public extension Optional {
  
  func ifNil(_ value: @autoclosure () -> Wrapped) -> Wrapped {
    switch self {
    case .none:
      return value()
      
    case .some(let value):
      return value
    }
  }
}
