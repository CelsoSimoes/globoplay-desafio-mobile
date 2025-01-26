//
//  MovieData.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 25/01/25.
//

import Foundation

struct PopularMoviesData: Codable, Equatable {
    let page: Int?
    let results: [MovieData]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
}

enum RequestCategories: String {
    case popular = "popular"
    case upcoming = "upcoming"
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
}

struct MovieData: Identifiable, Codable, Equatable {

    let id: Int?
    let title: String?
    let originalTitle: String?
    let overview: String?
    let releaseDate: String?
    let posterPath: String?
    let backdropPath: String?
    let popularity: Double?
    let voteAverage: Double?
    let voteCount: Int?
    let adult: Bool?
    let genreIds: [Int]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case adult
        case genreIds = "genre_ids"
    }
}
