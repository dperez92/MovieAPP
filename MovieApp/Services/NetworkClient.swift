//
//  NetworkClient.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class NetworkClient {
    
    func getMovieDetails(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        guard let url = URL.forMoviesById(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetail))
        }.resume()
        
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            print("URL: \(url)")
            guard let moviesResponse = try? JSONDecoder().decode(Movies.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
