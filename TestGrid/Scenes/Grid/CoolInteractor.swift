//
//  CoolInteractor.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation

public final class CoolInteractor: CoolInteraction {

  @Shared public var coolListService: CoolListService

  public func coolItems() -> [String] {
    return coolListService.coolItems()
  }
}

// MARK: - CoolInteractorInteraction

public protocol CoolInteraction {
  func coolItems() -> [String]
}
