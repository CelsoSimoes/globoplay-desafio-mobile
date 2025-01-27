//
//  HighlightsView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

// Duas approachs possíveis nessa tela para o texto não ficar massante:
// - Diminuir tamanho dos textos conforme quantidade;
// - Limitar número de linhas de texto (APLICADA)

import SwiftUI

struct HighlightsView: View {
    @State private var movieDetailsData: MovieDetailsData = MockedMovieDetailsData.emptyMock
    var movieId: Int
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 16) {
                
                ZStack(alignment: .bottom) {
                    
                    MoviePosterBackground(moviePosterbackground: movieDetailsData.posterURL)
                        .blur(radius: 3, opaque: false)
                        .frame(height: 700)
                    
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(2),
                                                               Color.black.opacity(0.0)]),
                                   startPoint: .bottom,
                                   endPoint: .top)
                        .frame(height: 500)
                    
                    VStack(spacing: 16) {
                        
                        MovieCardPosterView(moviePosterPath: movieDetailsData.posterURL)
                        
                        Text("\(movieDetailsData.title)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(3)
                        
                        Text("Filme")
                           .font(.headline)
                           .fontWeight(.regular)
                           .foregroundColor(Color(red: 133/255, green: 133/255, blue: 133/255))
                        
                        Text("\(movieDetailsData.overview)")
                           .font(.headline)
                           .fontWeight(.regular)
                           .foregroundColor(Color.white.opacity(0.8))
                           .lineLimit(8)
                        
                        HStack(alignment: .center, spacing: 16) {
                            TrailerButton()
                                .cornerRadius(8)
                            
                            MyListButton()
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
                
                HighlightsDetailsView(movieDetailsData: movieDetailsData)
                
            }
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
        .onAppear {
            loadMovieDetailsData()
        }
    }
    
    private func loadMovieDetailsData() {
        Task {
            let result = await MoviesWorker().getMovieDetails(movieId: self.movieId)
            switch result {
            case .success(let movieDetailsValues):
                self.movieDetailsData = movieDetailsValues
            case .failure(let error):
                print("Error retrieving movies: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    let mockedData = MockedMovieDetailsData.mock
    HighlightsView(movieId: mockedData.id)
}
