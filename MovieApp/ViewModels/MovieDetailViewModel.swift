//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 03-11-23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    private var networkClient = NetworkClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
    var rating: Int {
        let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
        return Int(ceil(ratingAsDouble ?? 0.0))
    }
    
    func getMoviesByImdbID(imdbID: String) {
        networkClient.getMovieDetails(imdbId: imdbID) { result in
            switch result {
            case .success(let detail):
                DispatchQueue.main.async {
                    self.movieDetail = detail
                    self.loadingState = .success
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
