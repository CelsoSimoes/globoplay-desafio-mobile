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

    // Ref link: https://developer.themoviedb.org/docs/image-basics
    private let imagesBaseURL: String = "https://image.tmdb.org/t/p/w500"
    
    var id: Int?
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

    var backdropURL: URL? {
        guard let backdropPath = backdropPath,
              let url = URL(string: imagesBaseURL + backdropPath)
        else { return nil }
        return url
    }

    var posterURL: URL? {
        guard let posterPath = posterPath,
              let url = URL(string: imagesBaseURL + posterPath)
        else { return nil }
        return url
    }

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

// Ref: 1º Filme da lista de filmes populares da response no site:
// https://developer.themoviedb.org/reference/movie-popular-list
// Consulta feita no dia 26/01/2025, 02:00
struct MockedMovieData {

    let mock = MovieData(
        id: 939243,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
    let mock2 = MovieData(
        id: 939244,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
    let mock3 = MovieData(
        id: 939245,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
    let mock4 = MovieData(
        id: 939246,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
    let mock5 = MovieData(
        id: 939247,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
    let mock6 = MovieData(
        id: 939248,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
    let mock7 = MovieData(
        id: 939249,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: """
        Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes.
        Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.
        """,
        releaseDate: "2024-12-19",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        popularity: 6679.454,
        voteAverage: 7.834,
        voteCount: 983,
        adult: false,
        genreIds: [28, 878, 35, 10751]
    )
}
