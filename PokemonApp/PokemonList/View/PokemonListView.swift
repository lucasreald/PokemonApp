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
                    VStack {
                        ForEach(viewModel.searchResults, id: \.name) { pokemon in
                            let pokemonName = pokemon.name.capitalized
                            let finalPokemonName = pokemonName.replacingOccurrences(of: "-", with: " ")

                            NavigationLink(
                                destination: PokemonDetailView(
                                    viewModel: PokemonDetailViewModel(
                                        pokemon: pokemon))
                            ) {
                                VStack {
                                    Text(finalPokemonName)
                                        .font(.custom("AmaticSC-Bold", size: 35))
                                        .frame(maxWidth: .infinity)
                                        .background(Color("color5"))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(color: .black, radius: 3)
                                        .padding(.horizontal, 30)
                                        .padding(6)
                                }
                            }
                        }
                    }
                    .onAppear {
                        viewModel.fetchPokemons()
                    }
                }
                .navigationTitle("")
                .toolbarBackground((Color("color4")), for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Pokémons: \(viewModel.numberOfPokemons())")
                            .foregroundColor(.white)
                    }
                }
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
