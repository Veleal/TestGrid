//
//  CoolCoordinator.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation
import UIKit

public final class CoolCoordinator: Coordinator {
  public typealias Controller = CoolViewController
  
  private weak var navigator: UINavigationController!
  
  public func start() -> UINavigationController {
    let view = createViewController()
    view.presenter = CoolPresenter(coordinator: self, interactor: CoolInteractor())
    
    let navigator = UINavigationController()
    defer { self.navigator = navigator }
    
    navigator.setViewControllers([view], animated: false)
    
    return navigator
  }
}

extension CoolCoordinator: CoolCoordination {}

// MARK: - CoolCoordination

public protocol CoolCoordination {}
