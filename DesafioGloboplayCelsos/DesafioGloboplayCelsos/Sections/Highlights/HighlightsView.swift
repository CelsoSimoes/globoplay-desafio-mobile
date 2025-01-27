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
import CoreData

struct HighlightsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var movieDetailsData: MovieDetailsData = MockedMovieDetailsData.emptyMock
    @State var isFavorite = false
    @State var isDetails = false
    @State var movieTrailerKey = ""
    var movieId: Int
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                
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
                            .frame(width: 160, height: 230)
                        
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
                            NavigationLink(destination: YoutubePlayerView(movieTrailerKey: movieTrailerKey)) {
                                TrailerButton()
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                if isFavorite {
                                    deleteFromFavorites()
                                } else {
                                    saveInFavorites()
                                }
                            }) {
                                MyListButton(isFavorited: self.$isFavorite)
                            }
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    isDetails.toggle()
                }) {
                    SelectionView(isDetails: self.$isDetails)
                        .padding(.top, 16)
                }
                .cornerRadius(8)
                
                if isDetails {
                    NavigationView {
                        HighlightsDetailsView(movieDetailsData: movieDetailsData)
                    }
                } else {
                    HighlightsRecommendations(movieId: movieId)
                }
                
            }
            .background(Color.black)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color(red: 31/255, green: 31/255, blue: 31/255))
        .onAppear {
            loadMovieDetailsData()
            checkFavorited()
            loadMovieTrailerKey()
        }
    }
    
    private func checkFavorited() {
        let isSavedMovie = UserDefaultsWorker().fetchMovie(byId: movieId)
        
        if isSavedMovie != nil {
            isFavorite = true
        } else {
            isFavorite = false
        }
    }
    
    private func loadMovieTrailerKey() {
        Task {
            let result = await MoviesWorker().getMovieTrailerKey(movieId: self.movieId)
            switch result {
            case .success(let trailerKey):
                self.movieTrailerKey = trailerKey
            case .failure(let error):
                print("Error retrieving movies: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveInFavorites() {
        guard let posterURL = movieDetailsData.posterURL else { return }
        
        let model = SavedMovies(id: movieId, posterURL: posterURL)
        
        let userDefaults = UserDefaultsWorker()
        userDefaults.saveMovie(movie: model)
        
        isFavorite = true
    }
    
    private func deleteFromFavorites() {
        UserDefaultsWorker().deleteMovie(byId: movieId)
        
        isFavorite = false
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
