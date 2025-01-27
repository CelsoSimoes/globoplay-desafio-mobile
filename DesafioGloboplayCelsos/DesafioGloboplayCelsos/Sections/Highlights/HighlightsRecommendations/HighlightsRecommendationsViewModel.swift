//
//  HighlightsRecommendationsViewModel.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

class HighlightsRecommendationsViewModel: ObservableObject {
    @Published var moviesRecommendationsData: [MovieData] = []
    @Published var errorMessage: String?
    var movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
        loadRecommendations()
    }
    
    func loadRecommendations() {
        Task {
            let result = await MoviesWorker().getMoviesRecomendations(movieId: self.movieId)
            switch result {
            case .success(let moviesDatas):
                guard let moviesDatasResults = moviesDatas.results else { return }
                DispatchQueue.main.async {
                    self.moviesRecommendationsData = moviesDatasResults
                    self.errorMessage = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func removeAllFavorites() {
        UserDefaultsWorker().clearAll()
        loadRecommendations()
    }
}
