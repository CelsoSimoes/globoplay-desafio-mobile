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
    @State private var upcomingMoviesDatas: [MovieData] = []
    @State private var nowPlayingMoviesDatas: [MovieData] = []
    
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
                    
                    MovieCardPosterCarousel(carouselTitle: "Em Breve",
                                            moviesDatas: upcomingMoviesDatas)
                    
                    MovieCardPosterCarousel(carouselTitle: "Agora nos cinemas",
                                            moviesDatas: nowPlayingMoviesDatas)
                }
                .onAppear {
                    loadMovieListWithCategory(.popular)
                    loadMovieListWithCategory(.topRated)
                    loadMovieListWithCategory(.upcoming)
                    loadMovieListWithCategory(.nowPlaying)
                }
            }
            .background(Color(red: 29/255, green: 29/255, blue: 29/255))
            .ignoresSafeArea(edges: .top)
        }
    }
    
    private func loadMovieListWithCategory(_ listCategory: RequestCategories) {
        Task {
            let result = await MoviesWorker().getMoviesList(listCategory)
            switch result {
            case .success(let moviesDatas):
                guard let moviesDatasResults = moviesDatas.results else { return }
                switch listCategory {
                case .popular:
                    popularMoviesDatas = moviesDatasResults
                case .topRated:
                    topRatedMoviesDatas = moviesDatasResults
                case .upcoming:
                    upcomingMoviesDatas = moviesDatasResults
                case .nowPlaying:
                    nowPlayingMoviesDatas = moviesDatasResults
                }
            case .failure(let error):
                print("Error retrieving movies: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView()
}
