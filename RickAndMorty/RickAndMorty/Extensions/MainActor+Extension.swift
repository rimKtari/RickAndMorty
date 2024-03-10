//
//  MainActor+Extension.swift
//  RickAndMorty
//
//  Created by RIMA on 10/3/2024.
//

import Foundation

extension MainActor {
    private static let timeout: UInt64 = 1_000_000_000
    
    static func waitOneSecond() async {
        try? await Task.sleep(nanoseconds: timeout)
    }
    
    static func waitFor(nanoseconds: UInt64) async {
        try? await Task.sleep(nanoseconds: nanoseconds)
    }
}

enum MainThread {
    static func run(_ closure: @escaping () -> Void) {
        Task {
            await MainActor.run {
                closure()
            }
        }
    }
}
