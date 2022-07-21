//
//  Sharable.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation

public protocol Shareable: AnyObject {

  static var shared: Self { get }
}
