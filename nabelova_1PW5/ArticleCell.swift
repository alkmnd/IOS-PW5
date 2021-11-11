//
//  ArticleCell.swift
//  nabelova_1PW5
//
//  Created by Наталья Белова on 11.11.2021.
//

import Foundation
import UIKit

class ArticleCell: UITableViewCell {
    public let articleModel = ArticleModel()
    let image: UIImageView = {
        let control = UIImageView()
        return control
    }()
    let titleLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        control.textAlignment = .center
        control.textColor = UIColor.black
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    let descriptionLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        control.textAlignment = .left
        control.textColor = UIColor.gray
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    private func loadImage() -> UIImage? {
        guard let data = try? Data(contentsOf: (articleModel.img?.url)!) else {
               return nil
           }
           return UIImage(data: data)
       }
}
