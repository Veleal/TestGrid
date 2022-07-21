//
//  CoolPresenter.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public final class CoolPresenter: NSObject {

  public weak var view: CoolPresenting!

  private let interactor: CoolInteraction
  private let coordinator: CoolCoordination
  private var gridDisplay: GridDisplay = .empty()

  public init(coordinator: CoolCoordination, interactor: CoolInteraction) {
    self.interactor = interactor
    self.coordinator = coordinator
  }

  public func onViewLoaded(columns: Int) {
    let coolItems = interactor.coolItems()
    let gridIRows = coolItems.chunked(into: columns).map { GridRowDisplay(gridItems: $0) }
    gridDisplay = GridDisplay(gridRows: gridIRows, columns: columns)
    view.renderGridLayout(with: gridDisplay)
  }
}

// MARK: - UICollectionViewDataSource

extension CoolPresenter: UICollectionViewDataSource {

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

// MARK: - CoolPresenting

public protocol CoolPresenting: AnyObject {
  func renderGridLayout(with grid: GridDisplay)
}
