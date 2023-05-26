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
                LinearGradient(colors: [Color("color4"), Color("color2"), Color("color1")], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()

                VStack {
                    Text(viewModel.pokemonName())
                        .font(.custom("PressStart2P-Regular", size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("color6"))
                        .shadow(color: .black, radius: 3)
                        .padding(.top, 30)

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

                    VStack {
                        Text("ID: \(viewModel.pokemon.id ?? 0)")
                            .padding(.vertical, 3)
                            .padding(.horizontal, 9)
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .padding()
                            .padding(.top, 20)

                        VStack {
                            HStack {
                                Text("Altura: \(viewModel.formatWeightHeight(value:viewModel.pokemon.height ?? 0)) m")
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("color4"))
                                    .cornerRadius(15)
                                    .shadow(color: .black, radius: 2)
                                    .padding(.bottom, 10)
                            }
                            .font(.custom("AmaticSC-Bold", size: 28))

                            HStack {
                                Text("Peso: \(viewModel.formatWeightHeight(value:viewModel.pokemon.weight ?? 0)) kg")
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("color4"))
                                    .cornerRadius(15)
                                    .shadow(color: .black, radius: 2)
                                    .padding(.bottom, 10)
                            }
                            .font(.custom("AmaticSC-Bold", size: 28))

                            HStack {
                                Text("EXP: \(viewModel.pokemon.baseExperience ?? 0)")
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("color4"))
                                    .cornerRadius(15)
                                    .shadow(color: .black, radius: 2)
                            }
                            .font(.custom("AmaticSC-Bold", size: 28))
                            .padding(.bottom, 30)
                        }
                    }
                    .padding(30)
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
