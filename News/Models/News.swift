//
//  News.swift
//  News
//
//  Created by Владимир Файб on 20.03.2022.
//

import Foundation

struct News: Decodable {
  let author: String?
  let title: String?
  let description: String?
  let urlToImage: String?
  let url: String?
}

struct NewsEnvelope: Decodable {
  let status: String
  let totalResults: Int
  let articles: [News]
}
