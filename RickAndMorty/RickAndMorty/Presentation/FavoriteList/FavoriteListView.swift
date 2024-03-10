//
//  FavoriteListView.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

struct FavoriteListView: View {
    
    @StateObject var viewModel: FavoriteListViewModel
    
    var columns : Array<GridItem> {
        return Array(repeating: GridItem(.flexible(minimum: 100), spacing: 5), count: 2)
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                if viewModel.listOfFavorites.isEmpty {
                    Text("You don't have any favorite list")
                }else {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.listOfFavorites) { characterModel in
                            
                            let characterDetailsViewModel = CharacterDetailsViewModel(charaterModel: characterModel)
                            CharacterItemView(viewModel: characterDetailsViewModel )
                        }
                        
                    }.padding([.leading, .trailing], 10)
                }
            }
        }
        .onAppear {
            viewModel.getFavoritesList()
        }
    }
}
