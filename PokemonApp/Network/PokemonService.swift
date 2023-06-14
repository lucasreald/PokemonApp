//
//  PokemonServices.swift
//  PokemonApp
//
//  Created by Lucas Real Dias on 22/05/23.
//


import Foundation

// MARK: - API solicitation

final class PokemonService { // The 'final' reserved key means that class will be not inherit and also help the compilation proccess.
    init() {}

    func pokemonList(completion: @escaping (Result<Pagination, Error>) -> Void) { // That closure will be called after the HTTP request and will return the recuperates data.
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1281") else { return } // Validate URL before continue, or return void (nil).
        let urlRequest = URLRequest(url: url) // URLRequest: Represents a HTTP request that will be sent to the server.
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in // Starts an asynchronous data transfer task using 'shared' of the URLSession.
            guard let data = data else { // Validate 'data' before continue, or return PokemonServiceError.dataEmpty.
                completion(.failure(PokemonServiceError.dataEmpty))
                return
            }
            do {
                let dataList = try JSONDecoder().decode(Pagination.self, from: data) // JSON decodification.
                completion(.success(dataList))
            } catch {
                completion(.failure(PokemonServiceError.deserializationFailed))
            }
        }
        task.resume() // Execute 'task'.
    }

    func pokemonDetail(url urlRequest: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        guard let url = URL(string: urlRequest) else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(.failure(PokemonServiceError.dataEmpty))
                return
            }
            do {
                let dataList = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(dataList))
            } catch {
                completion(.failure(PokemonServiceError.detailFailed))
            }
        }
        task.resume() // Execute 'task'.
    }
}

enum PokemonServiceError: LocalizedError {
    case dataEmpty
    case deserializationFailed
    case detailFailed

    var errorDescription: String? {
        switch self {
        case .dataEmpty:
            return "Nenhum Pokémon na lista."
        case .deserializationFailed:
            return "Falha na deserialização."
        case .detailFailed:
            return "Falha no carregamento."
        }
    }
}
