//
//  HighlightsViewModel.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

class HighlightsViewModel: ObservableObject {
    @Published var movieDetailsData: MovieDetailsData = MockedMovieDetailsData.emptyMock
    @Published var isFavorite: Bool = false
    @Published var isDetails: Bool = false
    @Published var movieTrailerKey: String = ""
    @Published var errorMessage: String?
    var movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
        loadMovieDetailsData()
        checkFavorited()
        loadMovieTrailerKey()
    }
    
    func loadMovieDetailsData() {
        Task {
            let result = await MoviesWorker().getMovieDetails(movieId: self.movieId)
            switch result {
            case .success(let movieDetailsValues):
                DispatchQueue.main.async {
                    self.movieDetailsData = movieDetailsValues
                    self.errorMessage = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func loadMovieTrailerKey() {
        Task {
            let result = await MoviesWorker().getMovieTrailerKey(movieId: self.movieId)
            switch result {
            case .success(let trailerKey):
                DispatchQueue.main.async {
                    self.movieTrailerKey = trailerKey
                    self.errorMessage = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func checkFavorited() {
        let isSavedMovie = UserDefaultsWorker().fetchMovie(byId: movieId)
        isFavorite = (isSavedMovie != nil)
    }
    
    func saveInFavorites() {
        guard let posterURL = movieDetailsData.posterURL else { return }
        let model = SavedMovies(id: movieId, posterURL: posterURL)
        let userDefaults = UserDefaultsWorker()
        userDefaults.saveMovie(movie: model)
        isFavorite = true
    }
    
    func deleteFromFavorites() {
        UserDefaultsWorker().deleteMovie(byId: movieId)
        isFavorite = false
    }
}
