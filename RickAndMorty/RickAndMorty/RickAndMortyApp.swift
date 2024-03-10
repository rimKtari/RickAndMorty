//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    @StateObject var networkMonitor = NetworkMonitor()

    var body: some Scene {
        WindowGroup {
            AppContentView()
                .environmentObject(networkMonitor)
        }
    }
}
