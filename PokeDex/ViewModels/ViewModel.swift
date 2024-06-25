//
//  ViewModel.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText.isEmpty ? pokemonList : pokemonList.filter { pokemon in
            pokemon.name?.contains(searchText.lowercased()) == true
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getDetails(pokemon: Pokemon) {
        guard let id = pokemon.id else {
            return
        }
        
        self.pokemonDetails = DetailPokemon.empty()
        
        pokemonManager.getDetailedPokemon(id: id) { detail in
            print(detail)
            DispatchQueue.main.async {
                self.pokemonDetails = detail
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let dVal = Double(value)
        
        return String(format: "%.2f", dVal / 10)
    }
}
    
