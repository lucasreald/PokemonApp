//
//  PokemonListView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color("color4").ignoresSafeArea()

                ScrollView {
                    pokemonList
                        .onAppear {
                            viewModel.fetchPokemons()
                        }
                }
                .navigationTitle("")
                .toolbarBackground((Color("color4")), for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Pokémons: \(viewModel.numberOfPokemons())")
                            .foregroundColor(.black)
                    }
                }
            }
            .searchable(text: $viewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always))
        }
    }

    var pokemonList: some View {
        VStack {
            ForEach(viewModel.searchResults, id: \.name) { pokemon in
                NavigationLink(
                    destination: PokemonDetailView(
                        viewModel: PokemonDetailViewModel(
                        pokemon: pokemon))
                ) {
                    VStack {
                        Buttons(buttonName: viewModel.pokemonName(pokemon),
                                fontSize: 35,
                                isMaxWidth: true)
                        .padding()
                    }
                }
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
