//
//  CreateCharactersListUseCase.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation


protocol CreateCharactersListUseCaseProtocol {
    func execute(characters: [CharacterResponse]) -> [CharacterModel]
}

class CreateCharactersListUseCase: CreateCharactersListUseCaseProtocol {
    
    
    func execute(characters: [CharacterResponse]) -> [CharacterModel] {
        guard !characters.isEmpty else { return [] }
        
        return characters.compactMap {
            CharacterModel(name: $0.name, photoURL: $0.image, gender: Gender(rawValue: $0.gender),
                           status: CharacterStatus(rawValue: $0.status), species: $0.species)
        }
    }
}
