//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {
    
    @Published var charaterModel: CharacterModel
    @UserDefaultsProperty(key: UserDefaultsKeys.favorites) private var favoriteCharacters: [CharacterModel]?
    
    init(charaterModel: CharacterModel) {
        self.charaterModel = charaterModel
    }
    
    func addToFavorite() {
        charaterModel.isFavorite = true
        favoriteCharacters?.append(charaterModel)
    }
    func removeFromFavorite() {
        charaterModel.isFavorite = false
        let index = favoriteCharacters?.firstIndex(of: charaterModel)
        if let index = index {
            favoriteCharacters?.remove(at: index)
        }
    }
    
    var isFavorite: Bool {
        return favoriteCharacters?.contains(where: { character in
            character.id == charaterModel.id
        }) ?? false
    }
}
