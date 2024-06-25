//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    let pokemon: Pokemon
    
    var body: some View {
        let id = vm.pokemonDetails?.id.description ?? "-"
        let weight = vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)
        let height = vm.formatHW(value: vm.pokemonDetails?.height ?? 0)
        
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(id)")
                Text("**Weight**: \(weight) Kg")
                Text("**Height**: \(height) M")
            }
        }.onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(
        pokemon: Pokemon.samplePokemon
    )
    .environmentObject(ViewModel())
}
