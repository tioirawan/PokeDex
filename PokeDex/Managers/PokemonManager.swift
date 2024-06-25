//
//  PokemonManager.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import Foundation

class PokemonManager: ObservableObject {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (DetailPokemon) -> ()) {
        let url: String = "https://pokeapi.co/api/v2/pokemon/\(id)"
        
        Bundle.main.fetchData(url: url, model: DetailPokemon.self, completion: completion) { failure in
            print(failure)
        }
    }
}
