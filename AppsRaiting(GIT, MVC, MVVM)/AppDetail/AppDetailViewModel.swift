//
//  AppDetailViewModel.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

class AppDetailViewModel: AppDetailViewModelProtocol {
    
    private var app: FeedResultsApp!
    
    var appName: String {
        return app.name
    }
    
    var artistName: String {
        return app.artistName
    }
    
    var releaseDate: String {
        return app.releaseDate
    }
    
    var imageUrl: Data? {
        return ImageManeger.shared.getImageData(from: app.imageUrl)
    }
    
    var isFavorite: Bool {
        get {
            return DataManager.shared.loadFavouriteStatus(for: app.name)
        }
        set {
            DataManager.shared.saveFavouriteStatus(for: app.name, with: newValue)
        }
    }
    
    required init(app: FeedResultsApp) {
        self.app = app
    }
}
