//
//  View+Extensions.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
