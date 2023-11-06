//
//  MovieDetailScreen.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 03-11-23.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbID: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM    )
            } else if movieDetailVM.loadingState == .failed {
                FailureView()
            }
        }
        .onAppear {
            self.movieDetailVM.getMoviesByImdbID(imdbID: imdbID)
        }
    }
}

//struct MovieDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailScreen(imdbID: <#String#>, body: <#some View#>)
//    }
//}
