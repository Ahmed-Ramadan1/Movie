//
//  MovieCollectionCellViewModel.swift
//  Movie
//
//  Created by Ahmed on 02/07/2026.
//

import Foundation

class MovieCollectionCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var image: URL?
    
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)"
        self.image = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}

