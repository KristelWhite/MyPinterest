//
//  TabBarModel.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.11.2023.
//

import UIKit

enum TabBarModel {
    case home
    case profile
    case favorite
    
    var label: String{
        switch self {
        case .home:
            return "Главная"
        case .profile:
            return "Профиль"
        case .favorite:
            return "Избранное"
        }
    }
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "homeTab")
        case .profile:
            return UIImage(named: "profileTab")
        case .favorite:
            return UIImage(named: "favoriteTab")
        }
    }
    var selectedImage: UIImage? {
        return image
    }
    
}
