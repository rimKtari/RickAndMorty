//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
