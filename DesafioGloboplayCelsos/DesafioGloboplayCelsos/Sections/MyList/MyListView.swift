//
//  MyListView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import SwiftUI

struct MyListView: View {
    
    private let viewTitle: String = "Minha Lista"
    @StateObject private var viewModel = MyListViewModel()
//    @State var moviesData: [MovieDetailsData] = []
    
    private var columns: [GridItem] {
        [GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())]
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(viewTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.removeAllFavorites()
                    }) {
                        Image(systemName: "trash.fill")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.black)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
//                        ForEach(moviesData) { movieData in
                        ForEach(viewModel.favoriteMovies) { movieData in
                            NavigationLink(destination: HighlightsView(movieId: movieData.id)) {
                                MovieCardPosterView(moviePosterPath: movieData.posterURL)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color(red: 31/255, green: 31/255, blue: 31/255))
            .onAppear {
                viewModel.loadFavoriteMovies()
//                loadPosters()
            }
        }
    }
    
//    private func loadPosters() {
//        Task {
//            for moviesIds in viewModel.favoriteMovies {
//                let movieDetails = await MoviesWorker().getMovieDetails(movieId: moviesIds.id)
//                switch movieDetails {
//                case .success(let dataObtida):
//                    moviesData.append(dataObtida)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        }
//    }
}

#Preview {
    MyListView()
}
