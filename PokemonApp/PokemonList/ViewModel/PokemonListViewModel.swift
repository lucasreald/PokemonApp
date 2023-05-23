//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//

// Shouldn't import 'SwiftUI' in the ViewModel.
import Combine
import Foundation

// ObservableObject: A type of object with a publisher that emits before the object has changed.

final class PokemonListViewModel: ObservableObject { // The 'final' reserved key means that class will be not inherit and also help the compilation proccess.
    let service: PokemonService = PokemonService() // Make the call to the API to get the list of pokémons.
    @Published var pokemons: [Pokemon] = [] // Allows changes to this property to be automatically reflected in the user interface if it is being observed.

    init() {}

    func fetchPokemons() { // Search pokémons from API and update the 'pokemons' property with the obtained data.
        service.pokemonList { pagination in
            DispatchQueue.main.async { // Ensure that updates to the UI are done on the main thread (UI thread).
                self.pokemons = pagination.results // The 'results' property contains the pokémon list obtained from the API.
            }
        }
    }
}
