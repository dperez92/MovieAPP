//
//  URL+Extensions.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import Foundation

extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)&")
    }
    
    static func forMoviesById(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)&")
    }
}
