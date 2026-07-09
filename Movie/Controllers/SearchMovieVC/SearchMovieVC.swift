//
//  SearchMovieVC.swift
//  Movie
//
//  Created by Ahmed on 06/06/2026.
//

import UIKit

class SearchMovieVC: UIViewController {

    @IBOutlet weak var searchResult: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // ViewModel
    var viewModel: SearchMovieViewModel = SearchMovieViewModel()

    // Varibles:
    //var cellDataSource: [MovieTableCellViewModel] = []
    var searchTimer : Timer?
    private let searchController = UISearchController(
        searchResultsController: nil
    )

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Search"
        //setupTableView()
        setupcollectionView()
        bindViewModel()

        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.stopAnimating()
        self.searchResult.text = "No results found"
        self.searchResult.isHidden = true
    }

    func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
    }

    func bindViewModel() {
        viewModel.reloadCollectionView = { [weak self] in
            self?.reloadCollectionView()
            self?.checkResults()

        }
        
        viewModel.isLoading = { isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
                
                
            }
        }


    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieId)
        else {
            return
        }
        let detailsVM = DetailsMovieViewModel(movie: movie)
        let detailsVC = DetailsMovieVC(viewModel: detailsVM)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        
    }
    
    func checkResults() {
       
            DispatchQueue.main.async {
                let query = self.searchController.searchBar.text ?? ""
                if self.viewModel.cellDataSource.isEmpty && !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                    self.searchResult.isHidden = false
                }else {
                    self.searchResult.isHidden = true
               
            }
        }
    }

}
