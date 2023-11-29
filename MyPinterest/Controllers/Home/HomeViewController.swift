//
//  HomeViewController.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.11.2023.
//

import UIKit

class HomeViewController: UIViewController {
//    MARK: - Constants
    enum Constants {
        static let spaceBeetweenElements: CGFloat = 8
        static let spaceBeetweenLines: CGFloat = 8
        static let horisontalInset: CGFloat = 16
        static let verticalInset: CGFloat = 10
    }
    // MARK: - Private properties
    private let model: HomePageModel = .init()
    
    // MARK: - Views
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - LiveCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureApperance()
        configureModel()
        model.getPosts()
    }
}

// MARK: - Methods
private extension HomeViewController {
    func configureApperance() {
        collectionView.register(UINib(nibName: "\(HomeCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(HomeCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: Constants.verticalInset, left: Constants.horisontalInset, bottom: Constants.verticalInset, right: Constants.horisontalInset)
    }
    func configureModel() {
        model.didUpdateModel = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCollectionViewCell.self)", for: indexPath) as? HomeCollectionViewCell
        guard let cell = cell else { return UICollectionViewCell() }
        let item = model.items[indexPath.row]
        cell.title = item.title
        cell.image = item.image
        cell.isFavorite = item.isFavorite
        cell.didFavoriteTapped = { [weak self] in
            self?.model.items[indexPath.row].isFavorite.toggle()
        }
        return cell
    }
}

// MARK: - FlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWight = ((collectionView.frame.width) - Constants.spaceBeetweenElements - ( Constants.horisontalInset * 2 )) / 2
        return CGSize(width: itemWight, height: 1.46 * itemWight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.spaceBeetweenLines
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.spaceBeetweenElements
    }
}

