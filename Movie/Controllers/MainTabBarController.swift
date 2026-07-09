//
//  MainTabBarController.swift
//  Movie
//
//  Created by Ahmed on 07/06/2026.
//

import Foundation
import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabs()
        
    }
    
    private func setupTabs() {
        
        let home = createHomeNavigationController()
        let search = createSearchNavigationController()
        viewControllers = [home,search]
        
    }
    
    private func createHomeNavigationController() -> UINavigationController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        let nav = UINavigationController(rootViewController: homeVC)
        nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        return nav
        
    }
    
    private func createSearchNavigationController() -> UINavigationController {
        
        let searchVC = SearchMovieVC()
        let nav = UINavigationController(rootViewController: searchVC)
        nav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        return nav
    }

        
    
    
}
