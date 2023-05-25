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

    func pokemonImageUrl() -> URL? {
        guard let id = pokemon.id else { return nil }
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }

    func pokemonName() -> String {
        let pokemonName = pokemon.name.capitalized
        let finalPokemonName = pokemonName.replacingOccurrences(of: "-", with: " ")
        return finalPokemonName
    }

    func formatWeightHeight(value: Int) -> String {
        let doubleValue = Double(value)
        let stringValue = String(format: "%.2f", doubleValue / 10)

        return stringValue
    }
}
