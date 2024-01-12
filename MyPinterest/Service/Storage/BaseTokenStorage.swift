//
//  BaseTokenStorage.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 14.12.2023.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
    private enum Constants {
        static let appName = "com.surf.education.project"
        static let tokenKey = "token"
        static let tokenDateKey = "tokenDate"
    }
    
    var dateStorage: UserDefaults {
        UserDefaults.standard
    }
    
    func getToken() throws -> TokenContainer {
//        TokenContainer(
//            token: "595d9f58b8ac34689b1326e2cf4ef803882995c267a00ce34c6220f4a6d8ed6a", receivingDate: Date()
//        )
        let token = try KeychainManager.getValue(forKey: Constants.tokenKey, forapp: Constants.appName)
        let date = try getTokenDate()
        return TokenContainer(token: token, receivingDate: date)
    }
    
    func set(newToken: TokenContainer) throws {
        try KeychainManager.setValue(newToken, forKey: Constants.tokenKey, forapp: Constants.appName)
        deleteTokenDate()
        setTokenDate(new: Date())
    }
}

private extension BaseTokenStorage {
    
    enum Error : Swift.Error {
        case dateWasNotFound
    }
    
    func getTokenDate() throws -> Date {
        guard let date = dateStorage.value(forKey: Constants.tokenDateKey) as? Date else {
            throw Error.dateWasNotFound
        }
        return date
    }
    
    func setTokenDate(new date: Date) {
        dateStorage.set(date, forKey: Constants.tokenDateKey)
    }
    
    func deleteTokenDate() {
        dateStorage.removeObject(forKey: Constants.tokenDateKey)
    }
    
}
