//
//  DetailsMovieViewModel.swift
//  Movie
//
//  Created by Ahmed on 14/05/2026.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImgeURL(movie.backdropPath ?? "")
    }
    
    private func makeImgeURL(_ path: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(path)")
    }
    
}
