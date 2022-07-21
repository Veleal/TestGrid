//
//  GridPresenter.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public final class GridPresenter: NSObject {

  public weak var view: GridPresenting!

  private let interactor: GridInteraction
  private let coordinator: GridCoordination
  private var gridDisplay: GridDisplay = .empty()

  public init(coordinator: GridCoordination, interactor: GridInteraction) {
    self.interactor = interactor
    self.coordinator = coordinator
  }

  public func onViewLoaded(columns: Int) {
    let gridItems = interactor.gridItems()
    let gridIRows = gridItems.chunked(into: columns).map { GridRowDisplay(gridItems: $0) }
    gridDisplay = GridDisplay(gridRows: gridIRows, columns: columns)
    view.renderGridLayout(with: gridDisplay)
  }
}

// MARK: - UICollectionViewDataSource

extension GridPresenter: UICollectionViewDataSource {

  public func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  {
    let cell: GridItemCell = collectionView.dequeueReusableCell(for: indexPath)
    let item = gridDisplay.gridRows[indexPath.section].gridItems[indexPath.row]
    cell.configure(with: item)
    cell.pinchAction = { pinch in
      switch pinch.orientation {
      case .horisontal:
        self.gridDisplay.updateColumnWidth(index: indexPath.row, scale: pinch.scale)

      case .vertical:
        self.gridDisplay.updateRowHeight(index: indexPath.section, scale: pinch.scale)

      case .diagonal:
        self.gridDisplay.updateRowHeight(index: indexPath.section, scale: pinch.scale)
        self.gridDisplay.updateColumnWidth(index: indexPath.row, scale: pinch.scale)

      case .unsupported:
        break
      }
      
      self.view.renderGridLayout(with: self.gridDisplay)
    }

    return cell
  }

  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return gridDisplay.gridRows[section].gridItems.count
  }

  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return gridDisplay.gridRows.count
  }
}

// MARK: - GridPresenting

public protocol GridPresenting: AnyObject {
  func renderGridLayout(with grid: GridDisplay)
}
