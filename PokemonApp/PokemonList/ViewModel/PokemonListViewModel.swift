//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//

// Shouldn't import 'SwiftUI' in the ViewModel.
import Combine
import Foundation
import UIKit
import SwiftUI

/// ObservableObject: A type of object with a publisher that emits before the object has changed.

 class PokemonListViewModel: ObservableObject { // The 'final' reserved key means that class will be not inherit and also help the compilation proccess.
    @Published var searchResults: [Pokemon] = [] // Publised: Anuncia algo novo para ser atualizado na view.

    @Published var searchText = "" {
        didSet {
            filterPokemons()
        }
    }

    @Published var errorDescription: String = ""

    let service: PokemonService = PokemonService() // Make the call to the API to get the list of pokémons.
    var pokemons: [Pokemon] = [] // Allows changes to this property to be automatically reflected in the user interface if it is being observed.

    var numberOfPokemons: String {
        let pokemonCounter = String(pokemons.count)
        return "Pokémons: \(pokemonCounter)"
    }

    init() {
        // Search bar color
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(Colors.searchBarGray)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
    }

    func fetchPokemons() { // Search pokémons from API and update the 'pokemons' property with the obtained data.
        service.pokemonList { result in
            switch result {
            case .success(let pagination):
                DispatchQueue.main.async { // Ensure that updates to the UI are done on the main thread (UI thread).
                    self.pokemons = pagination.results // The 'results' property contains the pokémon list obtained from the API.
                    self.filterPokemons()
                }
            case .failure(let error):
                DispatchQueue.main.async { // Ensure that updates to the UI are done on the main thread (UI thread).
                    self.errorDescription = error.localizedDescription
                }
            }
        }
    }

    func filterPokemons() {
        if searchText.isEmpty {
            searchResults = pokemons
        } else {
            searchResults = pokemons.filter { $0.name.contains(searchText.lowercased()) }
        }
    }

    func pokemonName(_ pokemon: Pokemon) -> String {
        let pokemonName = pokemon.name.capitalized.replacingOccurrences(of: "-", with: " ")
        return pokemonName
    }
}
