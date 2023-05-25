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
            ZStack {
                Color.gray.ignoresSafeArea()

                VStack {
                    // POKEMON CELL VIEW {
                    AsyncImage(url: viewModel.pokemonImageUrl()) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .shadow(color: .black, radius: 5)
                    } placeholder: {
                        ProgressView()
                            .scaleEffect(1.5)
                    }
                    .frame(maxWidth: 280)
                    .background(.gray)
                    .cornerRadius(50)
                    .shadow(color: .black, radius: 5)
                    // }

                    VStack {
                        Text("ID: \(viewModel.pokemon.id ?? 0)")
                            .padding(.vertical, 3)
                            .padding(.horizontal, 9)
                            .background(.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding()
                        Text("Altura: \(viewModel.formatWeightHeight(value:viewModel.pokemon.height ?? 0)) m")
                        Text("Peso: \(viewModel.formatWeightHeight(value:viewModel.pokemon.weight ?? 0)) kg")
                        Text("EXP: \(viewModel.pokemon.baseExperience ?? 0)")
                    }
                }
            }
            .onAppear {
                viewModel.searchPokemon()
            }
            .navigationTitle(viewModel.pokemonName())
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(
            viewModel: PokemonDetailViewModel(
                pokemon: Pokemon(
                    id: nil,
                    name: "",
                    baseExperience: nil,
                    height: nil,
                    weight: nil,
                    url: "")))
    }
}
