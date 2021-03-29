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
    
    var app: FeedResultsApp!
    private var isFavourite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavoyriteStatus()
        setupUI()
    }
    
    // MARK: - Update interface
    
    private func setupUI() {
        nameAppLabel.text = app.name
        developerNameLabel.text = app.artistName
        releaseDataLabel.text = app.releaseDate
        
        guard let imageURL = URL(string: app.imageUrl) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        imageAppView.image = UIImage(data: imageData)
        
        let imageFavourite = setImageForFavoriteButton()
        favouriteButton.setImage(imageFavourite, for: .normal)
    }
    
    // MARK: - Work with DataManager
    
    @IBAction private func toggleFavorite(_ sender: UIButton) {
        isFavourite.toggle()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
        DataManager.shared.saveFavouriteStatus(for: app.name, with: isFavourite)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return isFavourite ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
    
    private func loadFavoyriteStatus() {
        isFavourite = DataManager.shared.loadFavouriteStatus(for: app.name)
    }
}
