//
//  LabelView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 29/05/23.
//

import SwiftUI

struct LabelView: View {
    let text: String

    var body: some View {
        Text(text)
            .frame(width: 320, height: 50)
            .background(Colors.mediumGreen)
            .cornerRadius(10)
            .font(.custom("AmaticSC-Bold", size: 24))
            .foregroundColor(.white)
    }
}

struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(text: "Peso: 123.0")
    }
}
