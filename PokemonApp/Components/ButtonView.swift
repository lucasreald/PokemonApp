//
//  ButtonView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 29/05/23.
//

import SwiftUI

struct ButtonView: View {
    var buttonName = "Consultar"
    var fontSize = 40
    var height = 60
    var isMaxWidth = false

    var body: some View {
        if isMaxWidth {
            Text(buttonName)
                .font(.custom("AmaticSC-Bold", size: CGFloat(fontSize)))
                .frame(maxWidth: .infinity)
                .background(Colors.mediumBrown)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 3)
        } else {
            Text(buttonName)
                .font(.custom("AmaticSC-Bold", size: CGFloat(fontSize)))
                .frame(width: 300, height: CGFloat(height))
                .background(Colors.mediumBrown)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 3)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
