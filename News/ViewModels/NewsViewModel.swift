//
//  NewsViewModel.swift
//  News
//
//  Created by Владимир Файб on 21.03.2022.
//

import Foundation

struct NewsViewModel {
  let news: News
  var author: String {
    news.author ?? "Unknown"
  }
  
  var title: String {
    news.title ?? ""
  }
  
  var description: String {
    news.description ?? ""
  }
  
  var url: String {
    news.url ?? ""
  }
  
  var urlToImage: String {
    news.urlToImage ?? "https://tryeng.ru/wp-content/uploads/2019/04/Marketplace-Lending-News.jpg"
  }
}
