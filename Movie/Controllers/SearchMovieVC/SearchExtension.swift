//
//  SearchExtension.swift
//  Movie
//
//  Created by Ahmed on 06/06/2026.
//

import Foundation
import UIKit

extension SearchMovieVC: UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
  
    
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text ?? ""
        viewModel.searchMovie(query: query)
        print(query)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        self.registeCells()
    }
    
    func registeCells() {
        tableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }
        let cellDataSourceVM = viewModel.cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellDataSourceVM)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
