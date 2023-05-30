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
                Colors.darkGreen.ignoresSafeArea()

                VStack {
                    TextView(name: viewModel.pokemonName, size: 20)
                        .padding()

                    AsyncImageView(viewModel: viewModel)
                        .padding()

                    VStack {
                        LabelView(text: viewModel.formatHeight)
                        LabelView(text: viewModel.formatWeight)
                        LabelView(text: viewModel.baseExperience)
                    }
                    .padding(.bottom, 10)
                }
                .toolbarBackground((Colors.darkGreen), for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text(viewModel.pokemonId)
                            .foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                viewModel.searchPokemon()
            }
            .navigationTitle("")
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
