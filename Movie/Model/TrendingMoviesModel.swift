//
//  TrendingMoviesModel.swift
//  Movie
//
//  Created by Ahmed on 26/04/2026.
//

import Foundation


// MARK: - TrendingMovieModel
struct TrendingMovieModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    let name: String?
    let originalName, firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case title
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
    }
}



//
//
//// MARK: - Welcome
//nonisolated struct TrendingMovieModel: Codable, Sendable {
//    let page: Int
//    let results: [Movie]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//// MARK: - Result
//nonisolated struct Movie: Codable, Sendable {
//    let adult: Bool
//    let backdropPath: String?
//    let id: Int
//    let title: String?
//    let originalLanguage: OriginalLanguage
//    let originalTitle, overview, posterPath: String?
//    let mediaType: MediaType
//    let genreIDS: [Int]
//    let popularity: Double?
//    let releaseDate: String?
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//    let name: String?
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case id, title
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case posterPath = "poster_path"
//        case mediaType = "media_type"
//        case genreIDS = "genre_ids"
//        case popularity
//        case releaseDate = "release_date"
//        case video
//        case name
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}

//nonisolated enum MediaType: String, Codable, Sendable {
//    case movie = "movie"
//    case tv
//}
//
//nonisolated enum OriginalLanguage: String, Codable, Sendable {
//    case en = "en"
//    case pl = "pl"
//    case tr = "tr"
//}
