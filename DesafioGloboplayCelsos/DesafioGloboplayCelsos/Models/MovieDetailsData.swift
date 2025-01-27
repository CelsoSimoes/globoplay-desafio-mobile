//
//  MovieDetailsData.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 26/01/25.
//

import Foundation

struct MovieDetailsData: Identifiable, Codable, Equatable {
    
    // Ref link: https://developer.themoviedb.org/docs/image-basics
    private let imagesBaseURL: String = "https://image.tmdb.org/t/p/w500"
    
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let runtime: Int
    let status: String
    let tagline: String
    let budget: Int
    let revenue: Int
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let adult: Bool
    let backdropPath: String?
    let posterPath: String?
    let homepage: String?
    let originalLanguage: String
    let spokenLanguages: [SpokenLanguage]
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let genres: [Genre]
    let belongsToCollection: Collection?
    
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
        case runtime
        case status
        case tagline
        case budget
        case revenue
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case adult
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case homepage
        case originalLanguage = "original_language"
        case spokenLanguages = "spoken_languages"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case genres
        case belongsToCollection = "belongs_to_collection"
    }
}

struct SpokenLanguage: Codable, Equatable {
    let englishName: String
    let iso6391: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso6391 = "iso_639_1"
        case name
    }
}

struct ProductionCompany: Codable, Equatable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountry: Codable, Equatable {
    let iso31661: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case name
    }
}

struct Genre: Codable, Equatable {
    let id: Int
    let name: String
}

struct Collection: Codable, Equatable {
    let id: Int
    let name: String
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

import Foundation

struct MockedMovieDetailsData {
    static let mock = MovieDetailsData(
        id: 939243,
        title: "Sonic 3 - O Filme",
        originalTitle: "Sonic the Hedgehog 3",
        overview: "Sonic, Knuckles e Tails se reúnem contra um novo e poderoso adversário, Shadow, um vilão misterioso com poderes diferentes de tudo que eles já enfrentaram antes. Com suas habilidades superadas em todos os sentidos, a Equipe Sonic deve buscar uma aliança improvável na esperança de parar Shadow e proteger o planeta.",
        releaseDate: "2024-12-19",
        runtime: 110,
        status: "Released",
        tagline: "Nova aventura. Novo rival.",
        budget: 122000000,
        revenue: 422398000,
        popularity: 7240.445,
        voteAverage: 7.8,
        voteCount: 1029,
        adult: false,
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        posterPath: "/8HzA55GCjRTEC2YhPGna8Lc8qHo.jpg",
        homepage: "https://www.movieid.com/sonic3",
        originalLanguage: "en",
        spokenLanguages: [
            SpokenLanguage(englishName: "English", iso6391: "en", name: "English")
        ],
        productionCompanies: [
            ProductionCompany(id: 4, logoPath: "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png", name: "Paramount Pictures", originCountry: "US"),
            ProductionCompany(id: 333, logoPath: "/5xUJfzPZ8jWJUDzYtIeuPO4qPIa.png", name: "Original Film", originCountry: "US"),
            ProductionCompany(id: 77884, logoPath: "/dP2lxVNctD5Cried0IWVqgrO2o9.png", name: "Marza Animation Planet", originCountry: "JP"),
            ProductionCompany(id: 113750, logoPath: "/A3QVZ9Ah0yI2d2GiXUFpdlbTgyr.png", name: "SEGA", originCountry: "JP"),
            ProductionCompany(id: 10644, logoPath: "/ocLZIdYJBppuCt1rhYEb2jbpt5F.png", name: "Blur Studio", originCountry: "US"),
            ProductionCompany(id: 168701, logoPath: "/vWdZFT4V64CCv12D10m44duQjyg.png", name: "SEGA of America", originCountry: "US")
        ],
        productionCountries: [
            ProductionCountry(iso31661: "JP", name: "Japan"),
            ProductionCountry(iso31661: "US", name: "United States of America")
        ],
        genres: [
            Genre(id: 28, name: "Ação"),
            Genre(id: 878, name: "Ficção científica"),
            Genre(id: 35, name: "Comédia"),
            Genre(id: 10751, name: "Família")
        ],
        belongsToCollection: Collection(id: 720879, name: "Sonic: Coleção", posterPath: "/5Q47T9iOyjY5E9kmFjAIf49P1Gp.jpg", backdropPath: "/l5CIAdxVhhaUD3DaS4lP4AR2so9.jpg")
    )
    
    static let emptyMock = MovieDetailsData(id: 0, title: "", originalTitle: "", overview: "", releaseDate: "", runtime: 0, status: "", tagline: "", budget: 0, revenue: 0, popularity: 0, voteAverage: 0, voteCount: 0, adult: false, backdropPath: nil, posterPath: nil, homepage: nil, originalLanguage: "", spokenLanguages: [], productionCompanies: [], productionCountries: [], genres: [], belongsToCollection: nil)
}
