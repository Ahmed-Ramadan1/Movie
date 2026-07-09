//
//  MainMovieCellCV.swift
//  Movie
//
//  Created by Ahmed on 02/07/2026.
//

import UIKit
import SDWebImage
class MainMovieCellCV: UICollectionViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieCellCV"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCellCV", bundle: nil)
    }
    //IBOutlets:
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieImageView.layer.cornerRadius = 12
    }

    func setupCell(viewModel : MovieCollectionCellViewModel) {
        self.movieLabel.text = viewModel.title
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.image)
    }
}
