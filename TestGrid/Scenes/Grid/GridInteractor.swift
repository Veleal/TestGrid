//
//  GridInteractor.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation

public final class GridInteractor: GridInteraction {

  @Shared public var gridListService: GridListService

  public func gridItems() -> [String] {
    return gridListService.gridItems()
  }
}

// MARK: - GridInteractorInteraction

public protocol GridInteraction {
  func gridItems() -> [String]
}
