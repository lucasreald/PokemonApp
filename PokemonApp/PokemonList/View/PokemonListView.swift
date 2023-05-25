//
//  PokemonListView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//

import SwiftUI

struct PokemonListView: View {

    // @StateObject: Ensures that the viewModel object is kept alive for the lifetime of the view, even if there are state changes.
    @StateObject var viewModel = PokemonListViewModel()

    private let adaptativeColumns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptativeColumns, spacing: 10) {
                    ForEach(viewModel.pokemons, id: \.name) { pokemon in
                        let pokemonName = pokemon.name.capitalized
                        let finalPokemonName = pokemonName.replacingOccurrences(of: "-", with: " ")
                        NavigationLink(
                            destination: PokemonDetailView(
                                viewModel: PokemonDetailViewModel(
                                    pokemon: pokemon))
                        ) {
                            VStack {
                                // POKEMON IMAGE
                                
                                Text(finalPokemonName)
                                    .frame(width: 150, height: 150)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(20)
                                    .shadow(color: .black, radius: 5)
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchPokemons() // Execute 'fetchPokemons' method.
                }
            }
            .navigationTitle("Pokédex")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
