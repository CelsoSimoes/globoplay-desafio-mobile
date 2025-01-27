//
//  HomeView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 25/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var popularMoviesDatas: [MovieData] = []
    @State private var topRatedMoviesDatas: [MovieData] = []
    
    var body: some View {
        NavigationView { // Adicione o NavigationView aqui
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    Text("CelsosPlay")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(maxWidth: .infinity, minHeight: 120, alignment: .bottom)
                .background(Color.black)
                
                VStack(alignment: .center, spacing: 45) {
                    MovieCardPosterCarousel(carouselTitle: "Populares",
                                            moviesDatas: popularMoviesDatas)
                    
                    MovieCardPosterCarousel(carouselTitle: "Bem avaliados",
                                            moviesDatas: topRatedMoviesDatas)
                    
                    MovieCardPosterCarousel(carouselTitle: "Bem avaliados",
                                            moviesDatas: topRatedMoviesDatas)
                    
                    MovieCardPosterCarousel(carouselTitle: "Bem avaliados",
                                            moviesDatas: topRatedMoviesDatas)
                }
                .onAppear {
                    loadPopularMovies()
                    loadTopRatedMovies()
                }
            }
            .background(Color(red: 29/255, green: 29/255, blue: 29/255))
            .ignoresSafeArea(edges: .top)
        }
    }
    
    private func loadPopularMovies() {
        Task {
            let result = await MoviesWorker().getPopularMovies()
            switch result {
            case .success(let moviesDatas):
                guard let moviesDatasResults = moviesDatas.results else { return }
                popularMoviesDatas = moviesDatasResults
            case .failure(let error):
                print("Error retrieving movies: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadTopRatedMovies() {
        Task {
            let result = await MoviesWorker().getTopRatedMovies()
            switch result {
            case .success(let moviesDatas):
                guard let moviesDatasResults = moviesDatas.results else { return }
                topRatedMoviesDatas = moviesDatasResults
            case .failure(let error):
                print("Error retrieving movies: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView()
}
