//
//  HeaderView.swift
//  News
//
//  Created by Владимир Файб on 21.03.2022.
//

import UIKit

final class HeaderView: UIView {
  private var fontSize: CGFloat
  private lazy var headingLabel: UILabel = {
    let label = UILabel()
    label.text = "News"
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
    return label
  }()
  private lazy var subheadlineLabel: UILabel = {
    let label = UILabel()
    label.text = "Top Headlines"
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
    label.textColor = .gray
    return label
  }()
  private lazy var headerCircleImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
    imageView.image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
    return imageView
  }()
  
  private lazy var plusImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
    imageView.image = UIImage(systemName: "plus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
    return imageView
  }()
  
  private lazy var headerStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
    stack.axis = .horizontal
    stack.spacing = 10
    return stack
  }()
  
  func setupUI() {
    addSubview(headerStack)
    addSubview(subheadlineLabel)
    headerStack.anchor(top: topAnchor, left: leftAnchor)
    
    subheadlineLabel.anchor(top: headerStack.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8)
  }
  init(fontSize: CGFloat = 20) {
    self.fontSize = fontSize
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
