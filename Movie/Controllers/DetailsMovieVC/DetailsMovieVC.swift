//
//  DetailsMovieVC.swift
//  Movie
//
//  Created by Ahmed on 14/05/2026.
//

import UIKit
import SDWebImage

class DetailsMovieVC: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //View Model:
    var viewModel: DetailsMovieViewModel
    
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        configView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyGradientMask(to: imageView)
    }

    func configView() {
        //self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }

    func applyGradientMask(to imageView: UIImageView) {
        let gradientLayer = CAGradientLayer()
        
        // The frame of the layer should match the size of the image view
        gradientLayer.frame = imageView.bounds
        
        // Define the colors for the gradient:
        // Clear (transparent) to Opaque (solid)
        // The alpha change happens here
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.white.cgColor,
            UIColor.clear.cgColor
        ]
        
        // Locations define where the colors start/end (0.0 to 1.0)
        // Here, the image stays solid until 0.6, then fades to clear by 1.0
        gradientLayer.locations = [0.0, 0.7, 1.0]
        
        // Set the layer as the mask
        imageView.layer.mask = gradientLayer
    }

}
