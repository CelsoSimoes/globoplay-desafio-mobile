//
//  HighlightsRecommendations.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

struct HighlightsRecommendations: View {
    
    private let viewTitle: String = "Minha Lista"
    @State private var moviesRecomentationsData: [MovieData] = []
    var movieId: Int
    
    private var columns: [GridItem] {
        [GridItem(.flexible()),
         GridItem(.flexible())]
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(self.moviesRecomentationsData) { movieData in
                            NavigationLink(destination: HighlightsView(movieId: movieData.id ?? 0)) {
                                MovieCardPosterView(moviePosterPath: movieData.posterURL)
                            }
                        }
                    }
                    .padding()
                }
            }
            .background(Color(red: 31/255, green: 31/255, blue: 31/255))
            .onAppear {
                getRecommendations()
            }
    }
    
    private func getRecommendations() {
        Task {
            let result = await MoviesWorker().getMoviesRecomendations(movieId: self.movieId)
            switch result {
            case .success(let moviesDatas):
                guard let moviesDatasResults = moviesDatas.results else { return }
                moviesRecomentationsData = moviesDatasResults
                
            case .failure(let error):
                print("Error retrieving movies: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    let movieMock = MockedMovieData().mock
    HighlightsRecommendations(movieId: movieMock.id ?? 0)
}
