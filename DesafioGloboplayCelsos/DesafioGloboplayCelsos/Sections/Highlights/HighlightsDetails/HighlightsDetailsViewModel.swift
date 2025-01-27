//
//  HighlightsDetailsViewModel.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

class HighlightsDetailsViewModel: ObservableObject {
    @Published var movieDetailsData: MovieDetailsData
    
    init(movieDetailsData: MovieDetailsData) {
        self.movieDetailsData = movieDetailsData
    }
    
    func getGenres(genres: [Genre]) -> String {
        return genres.map { $0.name }.joined(separator: ", ")
    }
    
    func getStudios(studios: [ProductionCompany]) -> String {
        return studios.map { $0.name }.joined(separator: ", ")
    }
}
