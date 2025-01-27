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
    @StateObject private var viewModel: HighlightsViewModel

    init(movieId: Int) {
        _viewModel = StateObject(wrappedValue: HighlightsViewModel(movieId: movieId))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                ZStack(alignment: .bottom) {
                    MoviePosterBackground(moviePosterbackground: viewModel.movieDetailsData.posterURL)
                        .blur(radius: 3, opaque: false)
                        .frame(height: 700)
                    
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(2), Color.black.opacity(0.0)]), startPoint: .bottom, endPoint: .top)
                        .frame(height: 500)
                    
                    VStack(spacing: 16) {
                        MovieCardPosterView(moviePosterPath: viewModel.movieDetailsData.posterURL)
                            .frame(width: 160, height: 230)
                        
                        Text("\(viewModel.movieDetailsData.title)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(3)
                        
                        Text("Filme")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 133/255, green: 133/255, blue: 133/255))
                        
                        Text("\(viewModel.movieDetailsData.overview)")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white.opacity(0.8))
                            .lineLimit(8)
                        
                        HStack(alignment: .center, spacing: 16) {
                            NavigationLink(destination: YoutubePlayerView(movieTrailerKey: viewModel.movieTrailerKey)) {
                                TrailerButton()
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                if viewModel.isFavorite {
                                    viewModel.deleteFromFavorites()
                                } else {
                                    viewModel.saveInFavorites()
                                }
                            }) {
                                MyListButton(isFavorited: self.$viewModel.isFavorite)
                            }
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    viewModel.isDetails.toggle()
                }) {
                    SelectionView(isDetails: $viewModel.isDetails)
                        .padding(.top, 16)
                }
                .cornerRadius(8)
                
                if viewModel.isDetails {
                    HighlightsDetailsView(movieDetailsData: viewModel.movieDetailsData)
                } else {
                    HighlightsRecommendations(movieId: viewModel.movieId)
                }
                
                if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        viewModel.loadMovieDetailsData()
                    }
                    .padding()
                }
            }
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
    }
}

#Preview {
    let mockedData = MockedMovieDetailsData.mock
    HighlightsView(movieId: mockedData.id)
}
