//
//  UserDefaultsWorker.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import Foundation

class UserDefaultsWorker {
    
    private let userDefaults = UserDefaults.standard
    private let moviesKey = "savedMovies"
    
    func saveMovie(movie: SavedMovies) {
        var savedMovies = fetchMovies()
        savedMovies.append(movie)
        
        if let encodedData = try? JSONEncoder().encode(savedMovies) {
            userDefaults.set(encodedData, forKey: moviesKey)
        }
    }
    
    func deleteMovie(byId id: Int) {
        var savedMovies = fetchMovies()
        savedMovies.removeAll { $0.id == id }
        
        if let encodedData = try? JSONEncoder().encode(savedMovies) {
            userDefaults.set(encodedData, forKey: moviesKey)
        }
    }
    
    func fetchMovies() -> [SavedMovies] {
        guard let savedData = userDefaults.data(forKey: moviesKey),
              let savedMovies = try? JSONDecoder().decode([SavedMovies].self, from: savedData) else {
            return []
        }
        return savedMovies
    }
    
    func fetchMovie(byId id: Int) -> SavedMovies? {
        return fetchMovies().first { $0.id == id }
    }
    
    func clearAll() {
        userDefaults.removeObject(forKey: moviesKey)
    }
}
