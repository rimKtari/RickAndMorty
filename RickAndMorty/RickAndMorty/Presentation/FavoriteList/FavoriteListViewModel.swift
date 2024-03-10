//
//  FavoriteListViewModel.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    
    @Published var listOfFavorites: [CharacterModel]
    @UserDefaultsProperty(key: UserDefaultsKeys.favorites) private var favoriteCharacters: [CharacterModel]?

    init(listOfFavorites: [CharacterModel] = []) {
        self.listOfFavorites = listOfFavorites
    }
    
    func getFavoritesList() {
        guard let list = favoriteCharacters else {return}
        listOfFavorites = list
    }
}
