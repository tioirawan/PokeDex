//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import SwiftUI

@main
struct PokeDexApp: App {
    private let pokemonManager = PokemonManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokemonManager)
        }
    }
}
