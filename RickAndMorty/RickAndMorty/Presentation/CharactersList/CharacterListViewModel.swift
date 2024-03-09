//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import Foundation

//@Observable
class CharacterListViewModel: ObservableObject {
    
    private var getCharactersListUseCase: GetCharactersListUseCase
    
    @Published private(set) var state: CharacterListState = .loading

    init(getCharactersListUseCase: GetCharactersListUseCase = GetCharactersListUseCase()) {
        self.getCharactersListUseCase = getCharactersListUseCase
    }
    
    func fetchCharactersList() {        
        Task { @MainActor in
            do {
                let characters = try await getCharactersListUseCase.execute()
                self.state = .loaded(characters)
            } catch let error {
                self.state = .error(error.localizedDescription)
            }
        }

        
    }
    
    func onAppear() {
        fetchCharactersList()
    }
}
