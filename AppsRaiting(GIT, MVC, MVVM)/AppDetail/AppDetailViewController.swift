//
//  AppDetailViewController.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import UIKit

class AppDetailViewController: UIViewController {
    
    @IBOutlet private var nameAppLabel: UILabel!
    @IBOutlet private var imageAppView: UIImageView!
    @IBOutlet private var developerNameLabel: UILabel!
    @IBOutlet private var releaseDataLabel: UILabel!
    @IBOutlet private var favouriteButton: UIButton!
    
     var viewModel: AppDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Update interface
    
    private func setupUI() {

        nameAppLabel.text = viewModel.appName
        developerNameLabel.text = viewModel.artistName
        releaseDataLabel.text = viewModel.releaseDate
        guard let imageData = viewModel.imageUrl else { return }
        imageAppView.image = UIImage(data: imageData)
        
        let imageFavourite = setImageForFavoriteButton()
        favouriteButton.setImage(imageFavourite, for: .normal)
    }
    
    // MARK: - Work with DataManager
    
    @IBAction private func toggleFavorite(_ sender: UIButton) {
        viewModel.isFavorite.toggle()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return viewModel.isFavorite ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
}
