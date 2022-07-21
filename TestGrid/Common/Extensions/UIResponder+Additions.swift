//
//  UIResponder+Additions.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public extension UIResponder {

  @objc class var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}
