//
//  AppViewModel.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

class AppViewModel: AppViewModelProtocol {
    
    let appFreeURL = "https://rss.itunes.apple.com/api/v1/ru/ios-apps/top-free/all/10/explicit.json"
    let appPaidURL = "https://rss.itunes.apple.com/api/v1/ru/ios-apps/top-paid/all/10/explicit.json"
    
    var networkManager = NetworkManager()
    
    var apps: [FeedResultsApp] = []
    
    private var indexPath: IndexPath?
    
    func fetchAppsFree(completion: @escaping () -> Void) {
        networkManager.dataFetcher(stringUrl: appFreeURL) { apps in
            self.apps = apps
            completion()
        }
    }
    
    func fetchAppsPaid(completion: @escaping () -> Void) {
        networkManager.dataFetcher(stringUrl: appPaidURL) { apps in
            self.apps = apps
            completion()
        }
    }
    
    func numberOfRows() -> Int? {
        return apps.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> AppTableViewCellViewModelProtocol? {
        let app = apps[indexPath.row]
        return AppTableViewCellViewModel(app: app)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> AppDetailViewModelProtocol? {
        guard let indexPath = indexPath else { return nil }
        let app = apps[indexPath.row]
        return AppDetailViewModel(app: app)
    }
}
