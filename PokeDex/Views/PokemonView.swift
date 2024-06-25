//
//  PokemonView.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    
    let pokemon: Pokemon
    
    let dimension: Double = 140
    
    var body: some View {
        let id = pokemon.id ?? 0
        
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
            ) { image in
                image.resizable().scaledToFit().frame(
                    width: dimension, height: dimension
                )
            } placeholder: {
                ProgressView()
                    .frame(width: dimension, height: dimension )
            }
            .background(.thinMaterial)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text(pokemon.name?.capitalized ?? "-")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    PokemonView(
        pokemon: Pokemon.samplePokemon
    ).environmentObject(ViewModel())
}
