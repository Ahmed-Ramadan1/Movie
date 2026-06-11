//
//  MainViewModel.swift
//  Movie
//
//  Created by Ahmed on 26/04/2026.
//

import Foundation

class MainViewModel {
    
    //var isLoading: Observable<Bool> = Observable(false)
    //var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    var isLoading: ((Bool) -> ())?
    
    var cellDataSource: [MovieTableCellViewModel] = []
    var reloadTableView: (() -> Void)?
    func numberOfSections() -> Int {
        1
    }
    
//    func numberOfRows(in section: Int) -> Int {
//        self.dataSource?.results.count ?? 0
//    }
    
    func getData() {
//        if isLoading.value ?? true {
//            return
//        }
        self.isLoading?(true)
        APICaller.getTrendingMovies { [weak self]result in
            self?.isLoading?(false)
            
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self?.cellDataSource = data.results.map {movie in  MovieTableCellViewModel(movie: movie) }
                self?.reloadTableView?()
                self?.dataSource = data
//               self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func mapCellData() {
//        self.cellDataSource?(self.dataSource?.results.compactMap({ MovieTableCellViewModel(movie: $0)}) ?? [])
//    }
    
    func getMovieTitle(_ movie:Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retrieveMovie( with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
