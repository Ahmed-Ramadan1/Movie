//
//  SearchExtension.swift
//  Movie
//
//  Created by Ahmed on 06/06/2026.
//

import Foundation
import UIKit

extension SearchMovieVC: UISearchResultsUpdating, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text ?? ""
        
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            self?.viewModel.searchMovie(query: query)
        }
        print(query)
        //checkResults()
    }
    
    func setupcollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        self.collectionView.backgroundColor = .clear
        collectionView.keyboardDismissMode = .onDrag
        self.registeCells()
    }
    
    func registeCells() {
        collectionView.register(MainMovieCellCV.register(), forCellWithReuseIdentifier: MainMovieCellCV.identifier)
    }
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMovieCellCV.identifier, for: indexPath) as? MainMovieCellCV else {
            return UICollectionViewCell()
        }
        let cellViewModel = viewModel.cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieId = viewModel.cellDataSource[indexPath.row].id
        self.openDetail(movieId: movieId)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 24 // 8 + 8 (insets left + right) + 8 (inter)
            let width = (collectionView.bounds.width - padding) / 2
            return CGSize(width: width, height: width * 1.8) // 1.8 ratio includes space for title
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
