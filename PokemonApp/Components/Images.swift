//
//  ImageDetail.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 29/05/23.
//

import SwiftUI

struct Images: View {
    @State var imageName = "pokemon1"

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 300)
            .shadow(color: .black, radius: 3)
    }
}

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        Images()
    }
}
