//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

struct CharactersListView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject var viewModel: CharacterListViewModel
    
    var columns : Array<GridItem> {
        return Array(repeating: GridItem(.flexible(minimum: 100), spacing: 5), count: 2)
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    Text("Go To Favorite List").foregroundColor(.white)
                        .font(.system(size: 17, weight: .bold))
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 70)
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    coordinator.push(.favoriteList)
                }
                
            }
            .frame(height: 70)
            .background(.yellow)
            .padding()
            

            ScrollView {
                switch viewModel.state {
                case .loading:
                    loadingView
                case let .error( msg):
                    errorView(message: msg )
                case let .loaded(result) :
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(result) { characterModel in
                            
                            let characterDetailsViewModel = CharacterDetailsViewModel(charaterModel: characterModel)
                            CharacterItemView(viewModel: characterDetailsViewModel )
                                .onTapGesture {
                                    coordinator.push(.characterDetails(viewModel: characterDetailsViewModel))
                                }
                        }
                        
                    }.padding([.leading, .trailing], 10)
                }
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                Text("List of Characters")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.blue)
            }
        }
        .onAppear {
            viewModel.fetchCharactersList()
        }
        .onChange(of: networkMonitor.isConnected) {_, connection in
            if !connection  {
                viewModel.fetchFromLocal()
            }
        }
        
    }
    
    var loadingView: some View {
        ProgressView()
    }
    
    func errorView(message: String) -> some View {
        VStack {
            Image("errorState")
            Text(message)
        }
    }
}


