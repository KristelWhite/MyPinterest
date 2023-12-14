//
//  TokenStorage.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

protocol TokenStorage {
    
    func getToken() throws -> TokenContainer
    func set(newToken: TokenContainer) throws
    
}
