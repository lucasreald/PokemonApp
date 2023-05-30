//
//  PokemonDetailViewModel.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 24/05/23.
//

import Foundation
import Combine

final class PokemonDetailViewModel: ObservableObject {
    @Published var pokemon: Pokemon
    let service = PokemonService()

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    func searchPokemon() {
        guard let url = pokemon.url else { return }
        service.pokemonDetail(url: url) { pokemon in
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
    }

    var pokemonImageUrl: URL? {
        guard let id = pokemon.id else { return nil }
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }

    var pokemonName: String {
        let pokemonName = pokemon.name.capitalized.replacingOccurrences(of: "-", with: " ")
        return pokemonName
    }

    var formatHeight: String {
        let doubleValue = Double(pokemon.height ?? 0)
        let stringValue = String(format: "Altura: %.2f m", doubleValue / 10)
        return stringValue
    }

    var formatWeight: String {
        let doubleValue = Double(pokemon.weight ?? 0)
        let stringValue = String(format: "Peso: %.2f kg", doubleValue / 10)
        return stringValue
    }

    var baseExperience: String {
        "EXP: \(pokemon.baseExperience ?? 0)"
    }

    var pokemonId: String {
        "ID: \(pokemon.id ?? 0)"
    }

}
