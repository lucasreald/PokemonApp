//
//  TextView.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 29/05/23.
//

import SwiftUI

struct TextView: View {
    var name = "Pokédex"
    var size = 40
    var font = "PressStart2P-Regular"
    var color = Colors.lightBrown
    var isShadowOn = true

    var body: some View {
        Text(name)
            .font(.custom(font, size: CGFloat(size)))
            .foregroundColor(color)
            .shadow(color: .black, radius: isShadowOn ? 3 : 0)
            .multilineTextAlignment(.center)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
