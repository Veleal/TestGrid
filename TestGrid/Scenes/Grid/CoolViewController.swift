//
//  CoolViewController.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public final class CoolViewController: UIViewController, ViewController {
  @IBOutlet private weak var gridCollectionView: GridCollectionView!

  public static let storyboardName: UIStoryboard.Name = .main

  public var presenter: CoolPresenter! {
    didSet {
      presenter?.view = self
    }
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewLoaded(columns: gridCollectionView.columns)
    gridCollectionView.dataSource = presenter
    gridCollectionView.registerCells(for: [GridItemCell.self])
  }
}

extension CoolViewController: CoolPresenting {
  public func renderGridLayout(with grid: GridDisplay) {
    gridCollectionView.renderGridLayout(with: grid)
  }
}
