//
//  HomeCollectionViewCell.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 27.11.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
//    MARK: - Constants
    private enum Constants {
        static let heartImage = UIImage(named: "heart")
        static let fillHeartImage = UIImage(named: "heart-fill")
    }
    
//    MARK: - Views
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
//    MARK: - Actions
    @IBAction func tapFavorite(_ sender: Any) {
        didFavoriteTapped?()
        isFavorite.toggle()
    }
    
//    MARK: - Events
    var didFavoriteTapped: (()->Void)?
    
//    MARK: - Calculated
    var buttonImage: UIImage? {
        isFavorite ? Constants.fillHeartImage : Constants.heartImage
    }
    
//    MARK: - Properties
    var title: String = "" {
        didSet{
            titleLabel.text  = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet{
            favoriteButton.setImage(buttonImage, for: .normal)
        }
    }
    
//    MARK: - ViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

private extension HomeCollectionViewCell {
    
    func configureAppearance(){
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        
        imageView.layer.cornerRadius = 12
        
        favoriteButton.tintColor = .white
    }
}
