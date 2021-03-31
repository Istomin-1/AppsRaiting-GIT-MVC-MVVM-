//
//  AppTableViewCellViewModel.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

class AppTableViewCellViewModel: AppTableViewCellViewModelProtocol {
    
    private var app: FeedResultsApp
    
    var appName: String {
        return app.name
    }
    
    var imageData: Data? {
        return ImageManeger.shared.getImageData(from: app.imageUrl)
    }
    
    required init(app: FeedResultsApp) {
        self.app = app
    }
}
