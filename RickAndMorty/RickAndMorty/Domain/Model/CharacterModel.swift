//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation


struct CharacterModel: Identifiable {
    var id: UUID = .init()
    var name: String
    var photoURL: String
    var gender: Gender?
    var status: CharacterStatus?
    var species: String
}
enum Gender: String {
    case male = "Male"
    case female = "Female"
}

enum CharacterStatus: String {
    case dead = "Dead"
    case alive = "Alive"
    case unknown = "unknown"
}
