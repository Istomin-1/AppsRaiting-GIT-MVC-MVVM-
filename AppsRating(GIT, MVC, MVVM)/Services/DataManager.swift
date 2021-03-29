//
//  DataManager.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 29.03.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavouriteStatus(for appName: String, with status: Bool) {
        userDefaults.set(status, forKey: appName)
    }
    
    func loadFavouriteStatus(for appName: String) -> Bool {
        return userDefaults.bool(forKey: appName)
    }
}
