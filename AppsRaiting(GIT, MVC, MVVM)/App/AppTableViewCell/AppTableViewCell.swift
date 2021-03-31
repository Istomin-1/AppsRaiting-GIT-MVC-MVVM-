//
//  AppTableViewCell.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    var viewModel: AppTableViewCellViewModelProtocol! {
        didSet {
            textLabel?.text = viewModel.appName
            guard let imageData = viewModel.imageData else { return }
            imageView?.image = UIImage(data: imageData)
        }
    }
}
