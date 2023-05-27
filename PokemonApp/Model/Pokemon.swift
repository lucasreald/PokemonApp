//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//


import Foundation

/// Decodable: A type that can decode itself from an external representation.
/// Identifiable: A class of types whose instances hold the value of an entity with stable identity.

struct Pokemon: Codable, Identifiable { // Pokemons properties.
    var id: Int?
    let name: String
    let baseExperience: Int?
    let height: Int?
    let weight: Int?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id, name, height, weight, url
        case baseExperience = "base_experience"
    }
}

extension Pokemon {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        baseExperience = try values.decodeIfPresent(Int.self, forKey: .baseExperience)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
