//
//  HomeView.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 25/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView("Carregando filmes...")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        viewModel.loadMovies()
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
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
                                                        moviesDatas: viewModel.popularMovies)
                                
                                MovieCardPosterCarousel(carouselTitle: "Bem avaliados",
                                                        moviesDatas: viewModel.topRatedMovies)
                                
                                MovieCardPosterCarousel(carouselTitle: "Em Breve",
                                                        moviesDatas: viewModel.upcomingMovies)
                                
                                MovieCardPosterCarousel(carouselTitle: "Agora nos cinemas",
                                                        moviesDatas: viewModel.nowPlayingMovies)
                            }
                        }
                    }
                    .background(Color(red: 29/255, green: 29/255, blue: 29/255))
                    .ignoresSafeArea(edges: .top)
                }
            }
        }
        .onAppear {
            viewModel.loadMovies()
        }
    }
}

#Preview {
    HomeView()
}
