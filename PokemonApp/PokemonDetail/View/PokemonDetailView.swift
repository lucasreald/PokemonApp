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
                Color("color4").ignoresSafeArea()

                VStack {
                    Text(viewModel.pokemonName())
                        .font(.custom("PressStart2P-Regular", size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("color6"))
                        .shadow(color: .black, radius: 3)
                        .padding(.bottom, 5)

                    AsyncImage(url: viewModel.pokemonImageUrl()) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                            .scaleEffect(2.3)
                    }
                    .frame(width: 300, height: 300)
                    .shadow(color: .black, radius: 5)
                    .background(Color("color2"))
                    .cornerRadius(60)

                    VStack {
                        Text("ID: \(viewModel.pokemon.id ?? 0)")
                            .frame(height: 30)
                            .padding(.horizontal, 10)
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)

                        VStack {
                            HStack {
                                Text("Altura: \(viewModel.formatWeightHeight(value:viewModel.pokemon.height ?? 0)) m")
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("color2"))
                                    .cornerRadius(10)
                                    .padding(.bottom, 8)
                            }
                            .font(.custom("AmaticSC-Bold", size: 24))

                            HStack {
                                Text("Peso: \(viewModel.formatWeightHeight(value:viewModel.pokemon.weight ?? 0)) kg")
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("color2"))
                                    .cornerRadius(10)
                                    .padding(.bottom, 8)
                            }
                            .font(.custom("AmaticSC-Bold", size: 24))

                            HStack {
                                Text("EXP: \(viewModel.pokemon.baseExperience ?? 0)")
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("color2"))
                                    .cornerRadius(10)
                                    .padding(.bottom, 8)
                            }
                            .font(.custom("AmaticSC-Bold", size: 24))
                        }
                    }
                    .padding(.horizontal, 30)
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
