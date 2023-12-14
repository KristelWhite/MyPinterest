//
//  PicturesResponseModel.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

struct PicturesResponseModel : Decodable {
    
    var id: String
    var title: String
    var content: String
    var phoroURL: String
    var publocationDate: String
    
}
