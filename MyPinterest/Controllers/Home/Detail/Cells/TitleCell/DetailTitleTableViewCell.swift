//
//  DetailTitleTableViewCell.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.12.2023.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {
//    MARK: - Views

    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
//    MARK: - Properties
    
    var date: String? {
        didSet {
            dateLable.text = date
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
//    MARK: - UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

//    MARK: - DetailTitleTableViewCell
    
    private func configureAppearance() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .black
        
        
        dateLable.font = .systemFont(ofSize: 10)
        dateLable.textColor = UIColor(displayP3Red: 0xB3 / 255, green:  0xB3 / 255, blue:  0xB3 / 255, alpha: 1)
    }
    
}
