//
//  ContentView.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon), label: {
                            PokemonView(pokemon: pokemon)
                        })
                    }
                }
            }
            .animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
            .navigationTitle("Pokedex")
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
