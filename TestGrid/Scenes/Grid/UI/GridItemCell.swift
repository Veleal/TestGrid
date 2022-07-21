//
//  GridItemCell.swift
//  TestGrid
//
//  Created by Illya Kuznietsov on 15.07.2022.
//

import UIKit

public final class GridItemCell: UICollectionViewCell {
  @IBOutlet private weak var contentLabel: UILabel! {
    didSet {
      contentLabel.layer.borderColor = UIColor.black.cgColor
      contentLabel.layer.borderWidth = Constants.cellBorderWidth
    }
  }

  public var pinchAction: Callback<(scale: CGFloat, orientation: Orientation)>?

  //MARK: TODO: for some reason UIPinchGestureRecognizer frequently returns numberOfTouches '1' in State.ended.
  //That prevents using single .ended state for getting gesture orientation, needs some investigation.
  private var lastOrientation: Orientation = .unsupported

  required init?(coder: NSCoder) {
    super.init(coder: coder)

    configureGestures()
  }

  private func configureGestures() {
    let pinch = UIPinchGestureRecognizer(target: self, action:#selector(pinchRecognized(_:)))
    contentView.addGestureRecognizer(pinch)

    let singleTap = UITapGestureRecognizer(target: self, action:#selector(singleTapGestureRecognized(_:)))
    singleTap.numberOfTapsRequired = 1
    contentView.addGestureRecognizer(singleTap)

    let doubleTap = UITapGestureRecognizer(target: self, action:#selector(doubleTapGestureRecognized(_:)))
    doubleTap.numberOfTapsRequired = 2
    contentView.addGestureRecognizer(doubleTap)

    singleTap.require(toFail: doubleTap)
  }
  
  public func configure(with text: String) {
    contentLabel.text = text
  }

  @objc private func pinchRecognized(_ pinch: UIPinchGestureRecognizer) {
    switch  pinch.state {
    case .changed:
      if pinch.numberOfTouches >= 2 {
        lastOrientation = pinch.orientation
      }

    case .ended:
      pinchAction?((pinch.scale, lastOrientation))

    default:
      break
    }
  }

  @objc private func singleTapGestureRecognized(_ tap: UITapGestureRecognizer) {
    pinchAction?((Constants.zoomIn, Orientation.diagonal))
  }

  @objc private func doubleTapGestureRecognized(_ tap: UITapGestureRecognizer) {
    pinchAction?((Constants.zoomOut, Orientation.diagonal))
  }
}

private extension GridItemCell {
  struct Constants {
    public static let zoomIn: CGFloat = 2.0
    public static let zoomOut: CGFloat = 0.5
    public static let cellBorderWidth: CGFloat = 1.0
  }
}
