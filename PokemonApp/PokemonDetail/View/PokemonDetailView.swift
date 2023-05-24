//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 24/05/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject var viewModel: PokemonDetailViewModel

    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.pokemon.id).png"))
                Text("Altura: \(viewModel.pokemon.height ?? 0)m")
                Text("Peso: \(viewModel.pokemon.weight ?? 0)Kg")
            }
            .onAppear {
                viewModel.searchPokemon()
            }
            .navigationTitle(viewModel.pokemon.name)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(
            viewModel: PokemonDetailViewModel(
                pokemon: Pokemon(
                    name: "",
                    baseExperience: nil,
                    height: nil,
                    isDefault: nil,
                    order: nil,
                    weight: nil,
                    url: "")))
    }
}
