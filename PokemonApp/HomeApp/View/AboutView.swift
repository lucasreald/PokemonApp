//
//  AboutView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 26/05/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Colors.darkGreen.ignoresSafeArea()

            VStack {
                TextView(name: "Sobre", size: 50)
                    .padding()

                ImageView(imageName: "aboutImage")
                    .padding()

                TextView(name: "A Pokédex é uma enciclopédia virtual que detém todas as espécies de pokémons e suas principais características.",
                      size: 28,
                      font: "AmaticSC-Bold",
                      color: .black,
                      isShadowOn: false)
                    .padding()
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
