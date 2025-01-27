//
//  HighlightsRecommendations.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

struct HighlightsRecommendations: View {
    private let viewTitle: String = "Recomendações"
    @StateObject private var viewModel: HighlightsRecommendationsViewModel
    
    private var columns: [GridItem] {
        [GridItem(.flexible()),
         GridItem(.flexible())]
    }
    
    init(movieId: Int) {
        _viewModel = StateObject(wrappedValue: HighlightsRecommendationsViewModel(movieId: movieId))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let errorMessage = viewModel.errorMessage {
                ErrorView(message: errorMessage) {
                    viewModel.loadRecommendations()
                }
                .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.moviesRecommendationsData) { movieData in
                            NavigationLink(destination: HighlightsView(movieId: movieData.id ?? 0)) {
                                MovieCardPosterView(moviePosterPath: movieData.posterURL)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
    }
}

#Preview {
    let movieMock = MockedMovieData().mock
    HighlightsRecommendations(movieId: movieMock.id ?? 0)
}
