//
//  MoviesWorker.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 25/01/25.
//

import Foundation

protocol MoviesWorkerProtocol {
    func getMoviesList(_ movieListCategory: RequestCategories) async -> Result<MoviesListData, Error>
    func getMovieDetails(movieId: Int) async -> Result<MovieDetailsData, Error>
}


class MoviesWorker: MoviesWorkerProtocol {
    
    private let movieRequestBaseURL = "https://api.themoviedb.org/3/movie/"
    
    private func buildRequest(endpointValue: String) -> Result<URLRequest, Error> {
        
        // TODO: Criar struct de erros
        guard let url = URL(string: "\(movieRequestBaseURL)\(endpointValue)") else {
            return .failure(NSError(domain: "MoviesWorkerError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL for category \(endpointValue)"]))
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "pt-BR"),
            URLQueryItem(name: "page", value: "1"),
        ]
        components?.queryItems = queryItems
        
        guard let finalURL = components?.url else {
            return .failure(NSError(domain: "Invalid URL Components", code: 0, userInfo: nil))
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTE0ODM2ODUzOTE2YjIwOWE5OGU2Y2NlYTUyMTNkYSIsIm5iZiI6MTczNzg0OTQ1Ny44OCwic3ViIjoiNjc5NTdhNzEwZTFlMDQ4NmQ2MmFlYTI2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.n0B8psXMDbwhBv_8m-U6wEvGC27f8WVaWwqURhw-aKA"
        ]
        
        return .success(request)
    }
    
    func getMoviesList(_ movieListCategory: RequestCategories) async -> Result<MoviesListData, Error> {
        let request = buildRequest(endpointValue: movieListCategory.rawValue)
        
        switch request {
        case .failure(let error):
            return .failure(error)
            
        case .success(let request):
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let movieData = try JSONDecoder().decode(MoviesListData.self, from: data)
                return .success(movieData)
            } catch {
                return .failure(error)
            }
        }
    }
    
    func getMovieDetails(movieId: Int) async -> Result<MovieDetailsData, Error>  {
        let endpointValue = "\(movieId)"
        let request = buildRequest(endpointValue: endpointValue)
        
        switch request {
        case .failure(let error):
            return .failure(error)
            
        case .success(let request):
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let movieData = try JSONDecoder().decode(MovieDetailsData.self, from: data)
                return .success(movieData)
            } catch {
                return .failure(error)
            }
        }
    }
    
    
}
