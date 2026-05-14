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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
     
        viewModel.cellDataSource.bind { [weak self]movies in
            guard let self, let movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
            
        }
    }
    
    
}

