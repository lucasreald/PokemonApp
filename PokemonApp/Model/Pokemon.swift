//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//


import Foundation

// Decodable: A type that can decode itself from an external representation.
// Identifiable: A class of types whose instances hold the value of an entity with stable identity.

struct Pokemon: Decodable, Identifiable { // Pokemons properties.
    let id = UUID() // A universally unique value to identify types, interfaces, and other items.
    let name: String
    let baseExperience: Int?
    let height: Int?
    let isDefault: Bool?
    let order: Int?
    let weight: Int?
    let url: String?
}
