//
//  AppTableViewCellViewModel.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

class AppTableViewCellViewModel: AppTableViewCellViewModelProtocol {
    
    var appName: String {
        return app.name
    }
    
    var imageData: Data? {
        return ImageMeneger.shared.getImageData(from: app.imageUrl)
    }
    
    private var app: FeedResultsApp
    
    required init(app: FeedResultsApp) {
        self.app = app
    }
}
