//
//  MovieCardPosterCarousel.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MovieCardPosterCarousel: View {
    
    let carouselTitle: String
    let moviesDatas: [MovieData]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(carouselTitle)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 16) {
                    ForEach(self.moviesDatas) { movieData in
                        NavigationLink(destination: HighlightsView(movieId: movieData.id ?? 0)) {
                            MovieCardPosterView(moviePosterPath: movieData.posterURL)
                                .frame(width: 160, height: 230)
                        }
                        .padding(.leading, movieData.id == self.moviesDatas.first?.id ? 16 : 0)
                        .padding(.trailing, movieData.id == self.moviesDatas.last?.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

#Preview {
    let mockPosterPath = MockedMovieData().mock
    MovieCardPosterCarousel(carouselTitle: "Populares",
                            moviesDatas: [mockPosterPath,
                                          mockPosterPath,
                                          mockPosterPath,
                                          mockPosterPath,
                                          mockPosterPath,
                                          mockPosterPath,
                                          mockPosterPath,
                                          mockPosterPath])
}
