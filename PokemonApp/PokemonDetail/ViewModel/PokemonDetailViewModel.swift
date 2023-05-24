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


}
