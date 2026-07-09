//
//  SearchMovieViewModel.swift
//  Movie
//
//  Created by Ahmed on 06/06/2026.
//

import Foundation

class SearchMovieViewModel {
    
   // var cellDataSource: (([MovieTableCellViewModel]) -> ())?
    var dataSource: TrendingMovieModel?
    var cellDataSource: [MovieCollectionCellViewModel] = []
    var reloadCollectionView: (() -> Void)?
    var isLoading: ((Bool) -> Void)?
    
    
    func searchMovie(query: String) {
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            cellDataSource.removeAll()
            reloadCollectionView?()
            return
        }
        self.isLoading?(true)
        APICaller.searchMovie(query: query) { [weak self] result in
            self?.isLoading?(false)
            
            switch result {
            case .success(let data):
                print("Search Results Counts: \(data.results.count)")
                self?.cellDataSource = data.results.map { MovieCollectionCellViewModel(movie: $0) }
                self?.dataSource = data
                self?.reloadCollectionView?()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func retrieveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: { movie in movie.id == id } )
        else {
            return nil
        }
        return movie
    }
    
}
