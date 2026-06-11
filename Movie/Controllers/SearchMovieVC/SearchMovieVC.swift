//
//  SearchMovieVC.swift
//  Movie
//
//  Created by Ahmed on 06/06/2026.
//

import UIKit

class SearchMovieVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // ViewModel
    var viewModel : SearchMovieViewModel = SearchMovieViewModel()
    
    // Varibles:
    var cellDataSource: [MovieTableCellViewModel] = []
    
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        setupTableView()
        bindViewModel()
       
        configureSearchController()
    }

     func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    func bindViewModel() {
        viewModel.reloadTableView = { [weak self] in
            self?.reloadTableView()
            
        }
        
    }

  

}
