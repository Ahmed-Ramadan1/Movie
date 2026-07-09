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

    var isLoading: ((Bool) -> Void)?

    var cellDataSource: [MovieCollectionCellViewModel] = []
    var reloadCollectionView: (() -> Void)?
    func numberOfSections() -> Int {
        1
    }

    //    func numberOfRows(in section: Int) -> Int {
    //        self.dataSource?.results.count ?? 0
    //    }

    func getData() {
       
        self.isLoading?(true)
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading?(false)

            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self?.cellDataSource = data.results.map { movie in
                    MovieCollectionCellViewModel(movie: movie)
                }
                self?.reloadCollectionView?()
                self?.dataSource = data
            case .failure(let error):
                print(error)
            }
        }
    }

   

    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }

    func retrieveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: { $0.id == id })
        else {
            return nil
        }
        return movie
    }
}
