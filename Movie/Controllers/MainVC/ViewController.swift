//
//  ViewController.swift
//  Movie
//
//  Created by Ahmed on 26/04/2026.
//

import UIKit

class ViewController: UIViewController {
    
    
    //IBoutlets:
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel : MainViewModel = MainViewModel()
    
    // Varibles:
    var cellDataSource: [MovieTableCellViewModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindViewModel()
        
        // navi
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.isLoading = { isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
                
                
            }
        }
        viewModel.reloadTableView = { [weak self] in
//            self.cellDataSource = movies
            self?.reloadTableView()
            
        }
    }
            viewModel.isLoading.bind { [weak self] isLoading in
                guard let self = self, let isLoading = isLoading else {
                    return
                }
                            }
            }
    
    //        viewModel.cellDataSource.bind { [weak self]movies in
    //            guard let self, let movies else {
    //                return
    //            }
    //            self.cellDataSource = movies
    //            self.reloadTableView()
    //
    //        }
    //    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieId) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsVC = DetailsMovieVC(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        
        
        
    }
    
   
    
}

