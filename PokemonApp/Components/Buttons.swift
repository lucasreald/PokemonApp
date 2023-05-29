//
//  Buttons.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 29/05/23.
//

import SwiftUI

struct Buttons: View {
    @State var buttonName = "Consultar"
    @State var fontSize = 40
    @State var height = 60
    @State var isMaxWidth = false

    var body: some View {
        if isMaxWidth {
            Text(buttonName)
                .font(.custom("AmaticSC-Bold", size: CGFloat(fontSize)))
                .frame(maxWidth: .infinity)
                .background(Color("color5"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 3)
        } else {
            Text(buttonName)
                .font(.custom("AmaticSC-Bold", size: CGFloat(fontSize)))
                .frame(width: 300, height: CGFloat(height))
                .background(Color("color5"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 3)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
