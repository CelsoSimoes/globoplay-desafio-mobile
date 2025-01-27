//
//  HomeViewModel.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var popularMovies: [MovieData] = []
    @Published var topRatedMovies: [MovieData] = []
    @Published var upcomingMovies: [MovieData] = []
    @Published var nowPlayingMovies: [MovieData] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let moviesWorker = MoviesWorker()
    
    func loadMovies() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                async let popularMoviesTask = fetchMovies(for: .popular)
                async let topRatedMoviesTask = fetchMovies(for: .topRated)
                async let upcomingMoviesTask = fetchMovies(for: .upcoming)
                async let nowPlayingMoviesTask = fetchMovies(for: .nowPlaying)
                
                let popularMovies = try await popularMoviesTask
                let topRatedMovies = try await topRatedMoviesTask
                let upcomingMovies = try await upcomingMoviesTask
                let nowPlayingMovies = try await nowPlayingMoviesTask
                
                DispatchQueue.main.async {
                    self.popularMovies = popularMovies
                    self.topRatedMovies = topRatedMovies
                    self.upcomingMovies = upcomingMovies
                    self.nowPlayingMovies = nowPlayingMovies
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "Não foi possível carregar os filmes. Verifique sua conexão e tente novamente."
                }
            }
        }
    }
    
    private func fetchMovies(for category: RequestCategories) async throws -> [MovieData] {
        let result = await moviesWorker.getMoviesList(category)
        switch result {
        case .success(let moviesData):
            return moviesData.results ?? []
        case .failure(let error):
            throw error
        }
    }
}

