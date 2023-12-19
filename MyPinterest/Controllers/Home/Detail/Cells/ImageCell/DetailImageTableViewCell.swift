//
//  DetailImageTableViewCell.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.12.2023.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    
// MARK: - Views
    
    @IBOutlet weak var photoImageView: UIImageView!
    
//    MARK: - Properties
    
//    var image: UIImage? {
//        didSet {
//            photoImageView.image = image
//        }
//    }
    var imageURLInString : String = "" {
        didSet {
            if let url = URL(string: imageURLInString) {
                photoImageView.loadImage(from: url)
            }
        }
    }
    
//    MARK: -  UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
//     MARK: - DetailImageTableViewCell
    
    private func configureAppearance(){
        photoImageView.layer.cornerRadius = 12
        photoImageView.contentMode = .scaleAspectFill
    }
    
}
