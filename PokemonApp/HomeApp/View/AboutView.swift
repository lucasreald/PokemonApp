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
            LinearGradient(colors: [Color("color4"), Color("color2"), Color("color1")], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()

            VStack {
                Text("Sobre")
                   .font(.custom("PressStart2P-Regular", size: 54))
                   .foregroundColor(Color("color6"))
                   .padding(.top, 40)
                   .padding(.bottom, 40)
                   .shadow(color: .black, radius: 3)

                Image("pokemon3")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black, radius: 7)
                    .padding(.top, -25)
                    .frame(width: 300)

                Text("A Pokédex é uma enciclopédia virtual que detém todas as espécies de pokémons e suas principais características.")
                    .font(.custom("AmaticSC-Bold", size: 33))
                    .font(.system(size: 20))
                    .padding()
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
