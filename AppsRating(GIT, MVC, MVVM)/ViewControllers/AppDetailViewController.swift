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

    var app: FeedResultsApp!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        nameAppLabel.text = app.name
        developerNameLabel.text = app.artistName
        releaseDataLabel.text = app.releaseDate
        
        guard let imageURL = URL(string: app.imageUrl) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        imageAppView.image = UIImage(data: imageData)
}
}
