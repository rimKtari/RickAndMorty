//
//  RMAsyncImage.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

struct RMAsyncImage: View {
    
    var urlString: String
    
    var body: some View {
        let urlImage = URL(string: urlString)
        
        AsyncImage(url: urlImage) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}
