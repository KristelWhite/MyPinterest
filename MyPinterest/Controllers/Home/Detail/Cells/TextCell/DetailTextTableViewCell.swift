//
//  DetailTextTableViewCell.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.12.2023.
//

import UIKit

class DetailTextTableViewCell: UITableViewCell {
    
//    MARK: - Views

    @IBOutlet weak var textLable: UILabel!
    
//    MARK: - Properties
    
    var text: String? {
        didSet {
            textLable.text = text
        }
    }
    
//    MARK: -  UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

//    MARK: - DetailTextTableViewCell

    private func configureAppearance() {
        textLable.tintColor = .black
        textLable.font = .systemFont(ofSize: 12, weight: .light)
        textLable.numberOfLines = 0
     
    }
    
}
