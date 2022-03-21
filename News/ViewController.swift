//
//  ViewController.swift
//  News
//
//  Created by Владимир Файб on 20.03.2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

  var viewModel = NewsListViewModel()
  
  private lazy var headerView: HeaderView = {
    let view = HeaderView(fontSize: 32)
    return view
  }()
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.tableFooterView = UIView()
    tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(viewModel.newsVM.count)
    setupUI()
    fetchNews()
  }
  
  func setupUI() {
    view.backgroundColor = .white
    view.addSubview(headerView)
    view.addSubview(tableView)
    headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 16)
    tableView.anchor(top: headerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8)
  }
  
  func fetchNews() {
    viewModel.getNews { _ in
      self.tableView.reloadData()
    }
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.newsVM.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
    let news = viewModel.newsVM[indexPath.row]
    cell?.newsVM = news
    return cell ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let news = viewModel.newsVM[indexPath.row]
    guard let url = URL(string: news.url) else { return }
    let config = SFSafariViewController.Configuration()
    let safariController = SFSafariViewController(url: url, configuration: config)
    safariController.modalPresentationStyle = .fullScreen
    present(safariController, animated: true)
  }
}
