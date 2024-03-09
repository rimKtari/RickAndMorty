//
//  CharacterListState.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

enum CharacterListState {
    case loading
    case error(String)
    case loaded([CharacterModel])
}
