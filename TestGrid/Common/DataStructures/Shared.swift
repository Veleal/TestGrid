//
//  Shared.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation

@propertyWrapper public struct Shared<T: Shareable> {

  public var wrappedValue: T

  public init() {
    wrappedValue = T.shared
  }
}
