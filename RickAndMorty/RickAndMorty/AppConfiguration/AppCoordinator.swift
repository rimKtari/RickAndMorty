//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

enum Page:  Hashable, Identifiable {
    
    var id: UUID  {
        return UUID()
    }
    case charactersList
    case characterDetails(viewModel: CharacterDetailsViewModel)
    case favoriteList
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Page, rhs: Page) -> Bool {
        lhs.id == rhs.id
    }

}


class AppCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View{
        switch page {
        case .charactersList:
            CharactersListView(viewModel: CharacterListViewModel())
        case .characterDetails(let viewModel):
            CharacterDetailsView(viewModel: viewModel)
        case .favoriteList:
            FavoriteListView(viewModel: FavoriteListViewModel())
        }
    }
    
    func pop() {
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }

    
}
