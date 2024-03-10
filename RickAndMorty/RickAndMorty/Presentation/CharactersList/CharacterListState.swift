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
extension CharacterListState: Equatable {
    static func == (lhs: CharacterListState, rhs: CharacterListState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.loaded(lhsValue), .loaded(rhsValue)):
            return lhsValue == rhsValue
        case let (.error(lhsError), .error(rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }

    
}
