//
//  MovieTrailersData.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import Foundation

struct MovieTrailersData: Identifiable, Codable, Equatable {
    let id: Int
    let results: [Trailer]

    enum CodingKeys: String, CodingKey {
        case id
        case results
    }
}

struct Trailer: Identifiable, Codable, Equatable {
    let iso6391: String
    let iso3166_1: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name
        case key
        case site
        case size
        case type
        case official
        case publishedAt = "published_at"
        case id
    }
}
