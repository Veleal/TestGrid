//
//  Coordinator.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 18.07.2022.
//

import UIKit

public protocol Coordinator: AnyObject {

  associatedtype Controller: ViewController

  func createViewController() -> Controller
}

public extension Coordinator where Controller: UIViewController {

  func createViewController() -> Controller {
    return Controller.controller()
  }
}
