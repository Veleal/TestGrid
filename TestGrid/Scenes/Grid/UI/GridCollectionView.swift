//
//  GridCollectionView.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import Foundation
import UIKit

public final class GridCollectionView: UICollectionView {
  @IBInspectable var columns: Int = 3

  public func renderGridLayout(with grid: GridDisplay) {
    let layout = UICollectionViewCompositionalLayout { (rowIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
      let row = grid.gridRows[rowIndex]
      var items: [NSCollectionLayoutItem] = []

      for i in 0..<row.gridItems.count {
        items.append(NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(grid.columnWidths[i]),
            heightDimension: .fractionalHeight(1.0))))
      }
      
      let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(grid.rowHeights[rowIndex])),
        subitems: items)

      let section = NSCollectionLayoutSection(group: group)

      return section
    }

    setCollectionViewLayout(layout, animated: true)
  }
}
