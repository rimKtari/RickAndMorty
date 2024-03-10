//
//  CharacterItemView.swift
//  RickAndMorty
//
//  Created by RIMA on 10/3/2024.
//

import SwiftUI
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

