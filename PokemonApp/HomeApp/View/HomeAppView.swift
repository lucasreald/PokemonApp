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
                LinearGradient(colors: [Colors.darkGreen, Colors.mediumGreen, Colors.lightGreen],
                               startPoint: .bottom, endPoint: .top).ignoresSafeArea()

                VStack {
                    VStack {
                        TextView(name: "Pokédex", size: 45)
                            .padding()

                        ImageView()
                            .padding()
                    }

                    NavigationLink {
                        PokemonListView()
                    } label: {
                        ButtonView(buttonName: "Consultar")
                    }
                    .padding()

                    NavigationLink {
                        AboutView()
                    } label: {
                        ButtonView(buttonName: "Sobre")
                    }
                    .padding()
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
