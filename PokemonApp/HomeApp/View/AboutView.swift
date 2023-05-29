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
            Color("color4").ignoresSafeArea()

            VStack {
                Texts(name: "Sobre", size: 50)

                Images(imageName: "pokemon3")

                Texts(name: "A Pokédex é uma enciclopédia virtual que detém todas as espécies de pokémons e suas principais características.",
                      size: 33, font: "AmaticSC-Bold",
                      color: .black,
                      isShadowOn: false)
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
