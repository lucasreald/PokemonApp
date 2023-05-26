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
                LinearGradient(colors: [Color("color4"), Color("color2"), Color("color1")], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()

                VStack {
                    VStack {
                        Text("Pokédex")
                           .font(.custom("PressStart2P-Regular", size: 44))
                           .foregroundColor(Color("color6"))
                           .shadow(color: .black, radius: 3)
                           .padding(.top, 120)
                           .padding(.bottom, 40)

                        Image("pokemon1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .shadow(color: .black, radius: 3)
                            .padding()
                    }

                    NavigationLink {
                        PokemonListView()
                    } label: {
                        Text("Consultar")
                            .font(.custom("AmaticSC-Bold", size: 40))
                            .frame(width: 300, height: 60)
                            .background(Color("color5"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 3)
                            .padding(7)
                            .padding(.top, 10)
                    }

                    NavigationLink {
                        AboutView()
                    } label: {
                        Text("Sobre")
                            .font(.custom("AmaticSC-Bold", size: 40))
                            .frame(width: 300, height: 60)
                            .background(Color("color5"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 3)
                            .padding(7)
                            .padding(.bottom, 90)
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
