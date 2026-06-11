//
//  SearchMovieViewModel.swift
//  Movie
//
//  Created by Ahmed on 06/06/2026.
//

import Foundation

class SearchMovieViewModel {
    
   // var cellDataSource: (([MovieTableCellViewModel]) -> ())?
    
    var cellDataSource: [MovieTableCellViewModel] = []
    var reloadTableView: (() -> Void)?
    
    
    func searchMovie(query: String) {
        
        APICaller.searchMovie(query: query) { result in
            switch result {
            case .success(let data):
                self.cellDataSource = data.results.map { MovieTableCellViewModel(movie: $0) }
                self.reloadTableView?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
