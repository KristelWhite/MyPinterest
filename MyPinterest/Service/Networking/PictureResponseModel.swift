//
//  PictureResponseModel.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

struct PictureResponseModel : Decodable {
    
    var id: String
    var title: String
    var content: String
    var photoURL: String
    var publicationDate: String
    
}
