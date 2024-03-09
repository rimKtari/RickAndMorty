//
//  AppContentView.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

struct AppContentView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .charactersList)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    AppContentView()
}
