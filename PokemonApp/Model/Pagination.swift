//
//  Pagination.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//


/// Decodable: A type that can decode itself from an external representation.

struct Pagination: Decodable {
    let results: [Pokemon] // The constant 'results' is an array of the Pokemon struct.
}
