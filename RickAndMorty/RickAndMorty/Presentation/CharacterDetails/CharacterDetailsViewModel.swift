//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

@Observable
class CharacterDetailsViewModel {
    var charaterModel: CharacterModel
    init(charaterModel: CharacterModel) {
        self.charaterModel = charaterModel
    }
}
