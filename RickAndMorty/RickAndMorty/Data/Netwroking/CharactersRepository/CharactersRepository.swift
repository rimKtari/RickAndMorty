//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

protocol CharactersListRepositoryProtocol {
    func fetchCharactersList() async throws -> [CharacterResponse]?
}

class CharactersListRepository: CharactersListRepositoryProtocol {
    
    private let networkManager: MiddlewareManageable

    init(networkManager: MiddlewareManageable = MiddlewareManager()) {
        self.networkManager = networkManager
    }

    func fetchCharactersList() async throws -> [CharacterResponse]? {
        do {
            let request = CharactersListRequest()
            let response: [CharacterResponse]? = try await networkManager.asyncRequest(with: request)
            return response

        }
        catch {
            throw error
        }
    }

}

class CharactersListRequest: APIRequestConvertible {
    var path: String = "/character"
    var queryItems: [URLQueryItem] = []
}
