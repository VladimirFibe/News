//
//  NewsTableViewCell.swift
//  News
//
//  Created by Владимир Файб on 21.03.2022.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
  var newsVM: NewsViewModel? {
    didSet {
      if let newsVM = newsVM {
        titleLabel.text = newsVM.title
        NetworkManager.shared.getImage(urlString: newsVM.urlToImage) { data in
          if let data = data {
            DispatchQueue.main.async {
              self.newsImage.image = UIImage(data: data)
            }
          }
        }
      }
    }
  }
  
  var newsImageData: Data? {
    didSet {
      if let data = newsImageData {
        newsImage.image = UIImage(data: data)
      }
    }
  }
  
  private lazy var newsImage: ShadowImageView = {
    let shadow = ShadowImageView()
    return shadow
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    addSubview(titleLabel)
    addSubview(newsImage)
    newsImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 200)
    titleLabel.anchor(top: newsImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                      paddingTop: 8, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
  }
}
