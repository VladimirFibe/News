//
//  ShadowImageView.swift
//  News
//
//  Created by Владимир Файб on 21.03.2022.
//

import UIKit

class ShadowImageView: UIView {
  var image: UIImage? {
    didSet {
      imageView.image = image
    }
  }
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 20
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private lazy var baseView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 5, height: 5)
    view.layer.shadowOpacity = 0.7
    view.layer.shadowRadius = 10
    return view
  }()
  
  init() {
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func setupUI() {
    addSubview(baseView)
    baseView.addSubview(imageView)
    [baseView, imageView].forEach {
      $0.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
    baseView.layer.shouldRasterize = true
    baseView.layer.rasterizationScale = UIScreen.main.scale
  }
}
