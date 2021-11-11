//
//  ViewController.swift
//  nabelova_1PW5
//
//  Created by Наталья Белова on 10.11.2021.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var manager = ArticleManager()
    var news: [ArticleModel]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.articles?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.articleModel = manager.articles?[indexPath.row] ?? ArticleModel()
        cell.setupCell()
        cell.layer.masksToBounds = true
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let article = manager.articles?[indexPath.row]
//        let wc = WebViewController()
//        wc.url = article?.articleUrl
//        navigationController?.pushViewController(wc, animated: true)
//
//    }
//
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }

    private func handleMarkAsShare() {
        print("Share")
    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Share") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsShare()
                                            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [action])
    }
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Share") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsShare()
                                            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [action])
    
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            manager.setupArticles()
            view.backgroundColor = UIColor.darkGray
            setupArticleView()
            
        }
        
        private func setupArticleView(){
            let rect = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: view.frame.height - 30)
            
            tableView = UITableView(frame: rect)
            tableView.register(ArticleCell.self, forCellReuseIdentifier: "ArticleCell")
            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.backgroundColor = UIColor.clear
            tableView.rowHeight = 160
            tableView.showsVerticalScrollIndicator = true
            tableView.translatesAutoresizingMaskIntoConstraints = false //
            tableView.layer.cornerRadius = 35
            tableView.layer.masksToBounds = true
            
            self.view.addSubview(tableView)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            tableView.alwaysBounceVertical = true
        }
   
    

    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
}

