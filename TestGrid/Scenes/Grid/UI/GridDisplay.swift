//
//  GridDisplay.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public final class GridDisplay {

  public let gridRows: [GridRowDisplay]
  public var rowHeights: [CGFloat]
  public var columnWidths: [CGFloat]

  private let maxScale: CGFloat

  public init(gridRows: [GridRowDisplay], columns: Int ) {
    self.gridRows = gridRows
    rowHeights = gridRows.map {_ in Constants.defaultHeight }
    columnWidths = (0..<columns).indices.map {_ in 1 / columns.cgFloat }
    maxScale = max(Constants.minScale, Constants.widthPersantage - (Constants.minScale * (columns.cgFloat - 1)))
  }

  public func updateColumnWidth(index: Int, scale: CGFloat) {
    let widthPercentage = min(maxScale, max(Constants.minScale, columnWidths[index] * scale))
    let columnsExcluded = columnWidths.count.cgFloat - 1.0
    columnWidths = columnWidths.map {_ in (Constants.widthPersantage - widthPercentage) / columnsExcluded }
    columnWidths[index] = widthPercentage
  }

  public func updateRowHeight(index: Int, scale: CGFloat) {
    rowHeights[index] = max(Constants.minScale, rowHeights[index] * min(scale, Constants.maxScaleStep))
  }

  public static func empty() -> GridDisplay {
    return GridDisplay()
  }

  private init() {
    gridRows = []
    rowHeights = []
    columnWidths = []
    maxScale = 0
  }
}

private extension GridDisplay {
  struct Constants {
    public static let minScale: CGFloat = 0.1
    public static let widthPersantage: CGFloat = 1
    public static let maxScaleStep: CGFloat = 3
    public static let defaultHeight: CGFloat = 2 / 9
  }
}
