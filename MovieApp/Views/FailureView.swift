//
//  FailureView.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import SwiftUI

struct FailureView: View {
    var body: some View {
        Text("No movies were found.")
            .font(.headline)
            .foregroundColor(.red)
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        FailureView()
    }
}
