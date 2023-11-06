//
//  BaseViewModel.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 01-11-23.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}
class BaseViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
