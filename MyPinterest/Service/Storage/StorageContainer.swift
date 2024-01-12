//
//  StorageContainer.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

struct TokenContainer {
    
    let token: String
    let receivingDate: Date
    
    var tokenExpiringDate: TimeInterval {
        39600
    }
    
    var isExpiring: Bool {
        let now = Date()
        if now < receivingDate.addingTimeInterval(tokenExpiringDate) {
            return true
        } else {
            return false
        }
    }
}
