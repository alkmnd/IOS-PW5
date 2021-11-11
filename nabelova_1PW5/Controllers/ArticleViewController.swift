//
//  ViewController.swift
//  nabelova_1PW5
//
//  Created by Наталья Белова on 10.11.2021.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.articles.count
    }

    let manager = ArticleManager()

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell
        cell?.titleLabel.text = manager.articles[indexPath.row].title
        cell?.descriptionLabel.text = manager.articles[indexPath.row].description

            return cell ?? UITableViewCell()
    }

    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.tableView)
        self.tableView.register(ArticleCell.self, forCellReuseIdentifier: "ArticleCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        updateLayout(with: self.view.frame.size)
        
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
