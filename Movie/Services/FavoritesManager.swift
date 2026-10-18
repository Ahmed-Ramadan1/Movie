//
//  Observable.swift
//  Movie
//
//  Created by Ahmed on 05/05/2026.
//

import Foundation

final class FavoritesManager {
    
    private let favoritesKey = "favorite_movies"
    
    static let shared = FavoritesManager()
    
    private init() {}
    
    func getFavorites() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else {
            return []
        }
        guard let movies = try? JSONDecoder().decode([Movie].self, from: data) else {
            return []
        }
        
        return movies
    }
    
    func addToFavorites(_ movie: Movie) {
        
        var favorites = getFavorites()
        if favorites.contains(where: { $0.id == movie.id }) {
            return
        }
        favorites.append(movie)
        
        guard let data = try? JSONEncoder().encode(favorites) else {
            return
        }
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
    
    func removeFromFavorites(_ movie: Movie) {
        var favorites = getFavorites()
        favorites.removeAll(where: { $0.id == movie.id })
        
        guard let data = try? JSONEncoder().encode(favorites) else {
            return
        }
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
    
    func isFavorite(_ movie: Movie) -> Bool {
        let favorites = getFavorites()
        return favorites.contains(where: {$0.id == movie.id} )
    }
}


