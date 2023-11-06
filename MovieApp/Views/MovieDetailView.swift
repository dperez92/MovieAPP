//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 03-11-23.
//

import SwiftUI

struct MovieDetailView: View {
    let movieDetailVM:  MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10)
                
                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Director: \(movieDetailVM.director)")
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 10)
                Spacer()
            }.padding()
                .navigationTitle(movieDetailVM.title)
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
