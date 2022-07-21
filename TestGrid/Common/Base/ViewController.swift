//
//  ViewController.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 18.07.2022.
//

import UIKit

public protocol ViewController: AnyObject {
  static var storyboardName: UIStoryboard.Name { get }
}

public extension ViewController where Self: UIViewController {

  private static func allocate<T: UIViewController>(suffix: String) -> T {
    guard let identifier = "\(self)".components(separatedBy: "ViewController").first
      else {
        preconditionFailure("Unable to initialize view controller with name: \(self)")
    }
    return storyboardName.allocate(with: identifier + suffix)
  }

  static func controller() -> Self {
    return allocate(suffix: .empty)
  }

  static func navigation() -> UINavigationController {
    return allocate(suffix: "Navigation")
  }
}
