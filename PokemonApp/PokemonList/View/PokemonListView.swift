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

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(
                                viewModel: PokemonDetailViewModel(
                                    pokemon: pokemon))
                        ) {
                            Text(pokemon.name)
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
