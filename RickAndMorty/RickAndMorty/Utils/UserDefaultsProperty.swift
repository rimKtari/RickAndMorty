//
//  UserDefaultsProperty.swift
//  RickAndMorty
//
//  Created by RIMA on 10/3/2024.
//

import Foundation

@propertyWrapper
struct UserDefaultsProperty<T: Codable> {
    let key: String
    
    var wrappedValue: T? {
        get {
            if let objectT = UserDefaults.standard.object(forKey: key) as? Data {
                let decoder = JSONDecoder()
                return try? decoder.decode(T.self, from: objectT)
            }
            return nil
        }
        set {
            let encoder = JSONEncoder()
            if newValue != nil {
                if let encoded = try? encoder.encode(newValue) {
                    UserDefaults.standard.set(encoded, forKey: key)
                }
            } else {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
    }
}


struct UserDefaultsKeys {
    static let favorites = "favoriteList"
}
