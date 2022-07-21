//
//  String+Additions.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 18.07.2022.
//

import UIKit

public extension String {

  static let empty = ""

  var titled: String {
    return prefix(1).capitalized + dropFirst()
  }
}
