//
//  MovieListView.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]
    
    var body: some View {
        List(movies, id: \.imdbID) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbID: movie.imdbID)) {
                MovieCellView(movie: movie)
            }
        }
    }
}

//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}

struct MovieCellView: View {
    let movie: MovieViewModel
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
