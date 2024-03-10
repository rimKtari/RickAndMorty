//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation


struct CharacterModel: Codable,  Identifiable {
    var id: UUID = .init()
    var name: String
    var photoURL: String
    var gender: Gender?
    var status: CharacterStatus?
    var species: String
}

extension CharacterModel: Equatable {
    static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        lhs.id == lhs.id
    }
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
}

enum CharacterStatus: String, Codable {
    case dead = "Dead"
    case alive = "Alive"
    case unknown = "unknown"
}
