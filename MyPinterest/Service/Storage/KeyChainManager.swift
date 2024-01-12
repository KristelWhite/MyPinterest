//
//  KeyChainManager.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 11.01.2024.
//

import Foundation

class KeychainManager {
    
    private enum Error: Swift.Error {
        case wrongStatus
        case cantRepresentData
        
    }

    // Сохранение значения в Keychain
    static func setValue(_ value: TokenContainer , forKey key: String, forapp appName: String) throws {
        
        // Сначала удаляем существующее значение для предотвращения дублирования
        try deleteValue(forKey: key, forapp: appName)
        
        let data = try JSONEncoder().encode(value.token)
        
        // Создаем словарь с данными для сохранения
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        // Сохраняем данные в Keychain
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw Error.wrongStatus
        }
        
        print("Value saved to Keychain successfully.")
        
    }

    // Извлечение значения из Keychain
    static func getValue(forKey key: String, forapp appName: String) throws ->  String {
        // Создаем словарь с данными для извлечения
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status == errSecSuccess else {
            throw Error.wrongStatus
        }
        guard let data = dataTypeRef as? Data else {
            throw Error.cantRepresentData
        }

        // Преобразуем данные в строку
        let retrievingData = try JSONDecoder().decode(String.self, from: data)
        return retrievingData
    }

    // Удаление значения из Keychain
    static func deleteValue(forKey key: String, forapp appName: String) throws {
        // Создаем словарь с данными для удаления
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecAttrAccount as String: key
        ]

        // Удаляем данные из Keychain
        let status = SecItemDelete(query as CFDictionary)

        if status == errSecSuccess || status == errSecItemNotFound {
            print("Value deleted from Keychain successfully.")
        } else {
            throw Error.wrongStatus
        }
    }
}

