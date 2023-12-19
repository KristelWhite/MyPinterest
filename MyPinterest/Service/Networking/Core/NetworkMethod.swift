//
//  NetworkMetod.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 12.12.2023.
//

import Foundation

enum NetworkMethod: String {
    case get
    case post
    
}

extension NetworkMethod {
    
    func getMethod() -> String {
        return self.rawValue.uppercased()
    }
}
