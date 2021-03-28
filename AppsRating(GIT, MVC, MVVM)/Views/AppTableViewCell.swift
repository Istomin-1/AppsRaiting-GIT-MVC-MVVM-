//
//  AppTableViewCell.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    func configure(wit app: FeedResultsApp) {
        textLabel?.text = app.name
        guard let imageURL = URL(string: app.imageUrl) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else {
            return }
        imageView?.image = UIImage(data:  imageData)
    }
}
