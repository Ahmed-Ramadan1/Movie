//
//  ViewController+TableView.swift
//  Movie
//
//  Created by Ahmed on 26/04/2026.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }
        let cellViewModel = viewModel.cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        cell.selectionStyle = .none
        //cell.textLabel?.text = viewModel.getMovieTitle(movieData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = viewModel.cellDataSource[indexPath.row].id
        self.openDetail(movieId: movieId)
    }
}
