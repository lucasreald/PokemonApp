//
//  HomeAppView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 25/05/23.
//

import SwiftUI

struct HomeAppView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("color4"), Color("color2"), Color("color1")],
                               startPoint: .bottom, endPoint: .top).ignoresSafeArea()

                VStack {
                    VStack {
                        Texts(name: "Pokédex")

                        Images()
                    }

                    NavigationLink {
                        PokemonListView()
                    } label: {
                        Buttons()
                    }

                    NavigationLink {
                        AboutView()
                    } label: {
                        Buttons(buttonName: "Sobre")
                    }
                }
            }
        }
    }
}

struct HomeAppView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAppView()
    }
}
