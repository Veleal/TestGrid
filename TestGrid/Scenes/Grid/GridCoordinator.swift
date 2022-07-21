//
//  GridCoordinator.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation
import UIKit

public final class GridCoordinator: Coordinator {
  public typealias Controller = GridViewController
  
  private weak var navigator: UINavigationController!
  
  public func start() -> UINavigationController {
    let view = createViewController()
    view.presenter = GridPresenter(coordinator: self, interactor: GridInteractor())
    
    let navigator = UINavigationController()
    defer { self.navigator = navigator }
    
    navigator.setViewControllers([view], animated: false)
    
    return navigator
  }
}

extension GridCoordinator: GridCoordination {}

// MARK: - GridCoordination

public protocol GridCoordination {}
