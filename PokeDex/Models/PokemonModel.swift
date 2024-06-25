//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Tio Irawan on 25/06/24.
//

import Foundation

//{
//"count": 1302,
//"next": "https://pokeapi.co/api/v2/pokemon?offset=50&limit=50",
//"previous": null,
//"results": [
//{
//"name": "bulbasau

struct PokemonPage: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let name: String?
    let url: String?
    
    var id: Int? {
        let segments = url?.components(separatedBy: "/") ?? []
        return Int(segments[segments.count - 2])
    }
    
    static let samplePokemon = Pokemon(
        name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"
    )
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int?
    let weight: Int?
    
    static func empty() -> DetailPokemon {
        DetailPokemon(
            id: 0, height: 0, weight: 0
        )
    }
}
