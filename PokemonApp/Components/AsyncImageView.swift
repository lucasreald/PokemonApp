//
//  AsyncImageView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 30/05/23.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject var viewModel: PokemonDetailViewModel

    var body: some View {
        AsyncImage(url: viewModel.pokemonImageUrl) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
                .scaleEffect(2.3)
        }
        .frame(width: 300, height: 300)
        .shadow(color: .black, radius: 5)
        .background(Colors.mediumGreen)
        .cornerRadius(60)
    }
}

struct AsyncImages_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(viewModel: PokemonDetailViewModel(
            pokemon:
                Pokemon(id: nil,
                        name: "",
                        baseExperience: nil,
                        height: nil,
                        weight: nil,
                        url: "")))
    }
}
