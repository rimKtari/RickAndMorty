//
//  GetCharactersListUseCase.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation
protocol GetCharactersListUseCaseProtocol {
    func execute() async throws -> [CharacterModel]
}

class GetCharactersListUseCase: GetCharactersListUseCaseProtocol {
    
    private let charactersRepository: CharactersListRepositoryProtocol
    private var createCharactersListUseCaseProtocol: CreateCharactersListUseCaseProtocol

    init(charactersRepository: CharactersListRepositoryProtocol = CharactersListRepository(),
         createCharactersListUseCaseProtocol: CreateCharactersListUseCaseProtocol = CreateCharactersListUseCase())
    {
        self.charactersRepository = charactersRepository
        self.createCharactersListUseCaseProtocol = createCharactersListUseCaseProtocol
    }
    
    func execute() async throws -> [CharacterModel] {
        let characters  = try await charactersRepository.fetchCharactersList() ?? []
        return createCharactersListUseCaseProtocol.execute(characters: characters)
    }
    
}
