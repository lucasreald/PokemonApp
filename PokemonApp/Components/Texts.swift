//
//  Title.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 29/05/23.
//

import SwiftUI

struct Texts: View {
    @State var name = "Pokédex"
    @State var size = 40
    @State var font = "PressStart2P-Regular"
    @State var color = Color("color6")
    @State var isShadowOn = true

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
        Texts()
    }
}
