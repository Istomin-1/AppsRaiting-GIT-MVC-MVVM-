//
//  AppDetailViewController.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import UIKit

class AppDetailViewController: UIViewController {

    @IBOutlet var nameAppLabel: UILabel!
    @IBOutlet var imageAppView: UIImageView!
    @IBOutlet var developerNameLabel: UILabel!
    @IBOutlet var releaseDataLabel: UILabel!
    @IBOutlet var favouriteButton: UIButton!
    
    var app: FeedResultsApp!
    
    private var isFavourite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavoyriteStatus()
        setupUI()
    }
    
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
    @IBAction func toggleFavorite(_ sender: UIButton) {
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
