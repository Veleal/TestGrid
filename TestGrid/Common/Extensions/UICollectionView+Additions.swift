//
//  UICollectionView+Additions.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public extension UICollectionView {

  func dequeueReusableCell<T: UICollectionViewCell>(identifier: String, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
  }

  func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
    let identifier = String(describing: T.self)
    return dequeueReusableCell(identifier: identifier, for: indexPath) as! T
  }

  func registerCells(for types: [UICollectionViewCell.Type]) {
    types.forEach {
      register($0.nib, forCellWithReuseIdentifier: String(describing: $0))
    }
  }
}
