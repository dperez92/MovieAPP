//
//  ContentView.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 31-10-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                NetworkClient().getMoviesBy(search: "batman") { result in
                    switch result {
                    case .success(let movies):
                        print(movies)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
