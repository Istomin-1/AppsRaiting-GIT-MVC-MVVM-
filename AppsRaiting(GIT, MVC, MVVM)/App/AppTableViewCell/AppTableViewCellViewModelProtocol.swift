//
//  AppTableViewCellViewModelProtocol.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 30.03.2021.
//

import Foundation

protocol AppTableViewCellViewModelProtocol {
    var appName: String { get }
    var imageData: Data? { get }
    init(app: FeedResultsApp)
}
