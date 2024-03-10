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


struct CharacterItemView: View {
    
    var viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            RMCachedImage(urlString: viewModel.charaterModel.photoURL)
                .frame(height: 100)
                .padding(.top, 0)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(viewModel.charaterModel.name)
                    .lineLimit(1)
                    .font(.system(size: 16, weight: .bold))
                
                
                HStack {
                    Circle().frame(width: 15)
                        .foregroundColor(textColor())
                    
                    Text((viewModel.charaterModel.status?.rawValue ?? "") + "-" + viewModel.charaterModel.species)
                        .lineLimit(1)
                        .font(.system(size: 14))
                    
                }
            }
        }
        .frame(width: 165, height: 200)
        .background(viewModel.charaterModel.gender == .male ? Styles.Colors.lightBlue  : Styles.Colors.lightRed )
        .cornerRadius(10)
        
    }
    
    private func textColor() -> Color {
        switch viewModel.charaterModel.status {
        case .dead:
            return .red
        case .alive:
            return .green
        case .unknown, .none:
            return .gray
        }
    }
    
}

