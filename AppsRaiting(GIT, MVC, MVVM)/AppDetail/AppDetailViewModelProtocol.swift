//
//  AppDetailViewModelProtocol.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

protocol AppDetailViewModelProtocol {
    var appName: String { get }
    var artistName: String { get }
    var releaseDate: String { get }
    var imageUrl: Data? { get }
    var isFavorite: Bool { get set }
    
    init(app: FeedResultsApp)
}
