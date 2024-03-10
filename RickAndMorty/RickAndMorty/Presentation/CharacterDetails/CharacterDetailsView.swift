//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    var viewModel: CharacterDetailsViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    @State var isFavorite: Bool = false
    
    var body: some View {
        
        VStack{
            
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                Text("Back to Characters List")
            }.onTapGesture {
                coordinator.pop()
            }
            
            VStack {
                RMAsyncImage(urlString: viewModel.charaterModel.photoURL)
                    .frame(width: 300, height: 300)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Name: " + viewModel.charaterModel.name)
                    .font(.system(size: 20))
                Text("Status: " + (viewModel.charaterModel.status?.rawValue ?? ""))
                    .font(.system(size: 20))
                
                Text("Gender: " + (viewModel.charaterModel.gender?.rawValue ?? ""))
                    .font(.system(size: 20))
                    .foregroundStyle(genderColor)
                Button {
                    isFavorite ? viewModel.removeFromFavorite() : viewModel.addToFavorite()
                    isFavorite.toggle()
                } label: {
                    Text(favoriteButtonText)
                        .font(.system(size: 20))
                        .foregroundStyle(.red)
                }
                
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isFavorite = viewModel.isFavorite
        }
    }
    
    var genderColor: Color {
        viewModel.charaterModel.gender == .male ? Styles.Colors.lightBlue  : Styles.Colors.lightRed
    }
    var favoriteButtonText: String {
        isFavorite ? "Remove favorite" : "Add to favorite"
    }
}

