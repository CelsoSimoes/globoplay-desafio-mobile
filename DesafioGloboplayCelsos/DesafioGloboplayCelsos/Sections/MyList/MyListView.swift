//
//  MyListView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MovieCardPosterGrid: View {
    
    private let viewTitle: String = "Minha Lista"
    let moviesDatas: [MovieData]
    
    private var columns: [GridItem] {
        [GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(viewTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.black)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(self.moviesDatas) { movieData in
                        NavigationLink(destination: HighlightsView(movieId: movieData.id ?? 0)) {
                            MovieCardPosterView(moviePosterPath: movieData.posterURL)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
        
    }
}

#Preview {
    let mockMovieData = MockedMovieData().mock
    let mockMovieData2 = MockedMovieData().mock2
    let mockMovieData3 = MockedMovieData().mock3
    let mockMovieData4 = MockedMovieData().mock4
    let mockMovieData5 = MockedMovieData().mock5
    let mockMovieData6 = MockedMovieData().mock6
    let mockMovieData7 = MockedMovieData().mock7
    MovieCardPosterGrid(moviesDatas: [mockMovieData,
                                      mockMovieData2,
                                      mockMovieData3,
                                      mockMovieData4,
                                      mockMovieData5,
                                      mockMovieData6,
                                      mockMovieData7,
                                      mockMovieData])
}
