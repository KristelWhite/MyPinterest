//
//  HomeModel.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 27.11.2023.
//

import Foundation
import UIKit

final class HomePageModel {
    
//    MARK: - Events
    var didUpdateModel: (()->Void)?
    
//    MARK: - Properties
    var items: [ItemModel] = []
    
//    MARK: - Methods
    func getPosts() {
        items = Array(repeating: ItemModel.createDefoults(), count: 100)
    }
}

struct ItemModel {
    var image: UIImage?
    var title: String
    var isFavorite: Bool
    var creationDate: String
    var content: String
    
    static func createDefoults()-> ItemModel{
        .init(image: UIImage(named: "cat"), title: "the cuttest cat", isFavorite: false, creationDate: "27/11/23", content: "The Birman cat breed resembles a long-haired Siamese, but the Birman always has white-socked feet and magnificent blue eyes along with the characteristic dark mask, ears, tail, and legs. These cute and cuddly felines are very sweet and gentle, and they hate to be alone, preferring the company of their humans, other cats, or even cat-friendly dogs.")
    }
}
