//
//  NetworkManager.swift
//  News
//
//  Created by Владимир Файб on 20.03.2022.
//

import Foundation

class NetworkManager {
  let imageCache = NSCache<NSString, NSData>()
  
  static let shared = NetworkManager()
  
  private init() {}
  
  private let baseUrlString = "https://newsapi.org/v2/"
  private let USTopHeadline = "top-headlines?country=us"
  
  func getNews(completion: @escaping ([News]?) -> Void) {
    let urlString = "\(baseUrlString)\(USTopHeadline)&apiKey=\(APIKey.key)"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil, let data = data else {
        completion(nil)
        return
      }
      let newsEnvelop = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
      if let newsEnvelop = newsEnvelop {
        completion(newsEnvelop.articles)
      } else {
        completion(nil)
      }
    }.resume()
  }
  
  func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }
    if let cacheImage = imageCache.object(forKey: NSString(string: urlString)) {
      completion(cacheImage as Data)
    } else {
      URLSession.shared.dataTask(with: url) { data, response, error in
        guard error == nil, let data = data else {
          completion(nil)
          return
        }
        self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
        completion(data)
      }.resume()
    }
  }
}
