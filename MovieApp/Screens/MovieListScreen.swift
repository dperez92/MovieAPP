//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onCommit: {
                self.movieListVM.searchByName(name: self.movieName)
            }).textFieldStyle(.roundedBorder)
            Spacer()
                .navigationTitle("Movies")
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                FailureView()
            }
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
