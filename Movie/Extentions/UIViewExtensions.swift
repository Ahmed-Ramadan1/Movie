//
//  UIViewExtensions.swift
//  Movie
//
//  Created by Ahmed on 10/05/2026.
//

import Foundation
import UIKit

extension UIView {
    func round( _ radiuis: CGFloat = 10) {
        self.layer.cornerRadius = radiuis
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
