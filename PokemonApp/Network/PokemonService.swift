//
//  PokemonServices.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//


import Foundation

// API solicitation.
final class PokemonService { // The 'final' reserved key means that class will be not inherit and also help the compilation proccess.
    init() {}

    func pokemonList(completion: @escaping (Pagination) -> Void) { // That closure will be called after the HTTP request and will return the recuperates data.
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return } // Validate URL before continue, or return void (nil).
        let urlRequest = URLRequest(url: url) // URLRequest: Represents a HTTP request that will be sent to the server.
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in // Starts an asynchronous data transfer task using 'shared' of the URLSession.
            guard let data = data else { return } // Validate 'data' before continue, or return void (nil).
            do {
                let dataList = try JSONDecoder().decode(Pagination.self, from: data) // JSON decodification.
                completion(dataList)
            } catch {
                print(error)
            }
        }
        task.resume() // Execute 'task'.
    }

    func pokemonDetail(url urlRequest: String, completion: @escaping (Pokemon) -> Void) {
        guard let url = URL(string: urlRequest) else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            do {
                let dataList = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(dataList)
            } catch {
                print(error)
            }
        }
        task.resume() // Execute 'task'.
    }
}

