//
//  MyListViewModel.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

class MyListViewModel: ObservableObject {
    @Published var favoriteMovies: [SavedMovies] = []
    
    init() {
        loadFavoriteMovies()
    }
    
    func loadFavoriteMovies() {
        favoriteMovies = UserDefaultsWorker().fetchMovies()
    }
    
    func removeAllFavorites() {
        UserDefaultsWorker().clearAll()
        loadFavoriteMovies()
    }
}
