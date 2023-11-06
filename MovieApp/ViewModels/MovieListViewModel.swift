//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import Foundation

class MovieListViewModel: BaseViewModel {
    @Published var movies = [MovieViewModel]()
    let networkClient = NetworkClient()
    
    func searchByName(name: String) {
        if name.isEmpty { return }
        self.loadingState = .loading
        networkClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    var imdbID: String {
        movie.imdbID
    }
    var title: String {
        movie.title
    }
    var year: String {
        movie.year
    }
    var poster: String {
        movie.poster
    }
}
