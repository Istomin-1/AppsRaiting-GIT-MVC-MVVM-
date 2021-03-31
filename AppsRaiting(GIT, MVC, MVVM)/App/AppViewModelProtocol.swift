//
//  AppViewModelProtocol.swift
//  AppsRaiting(GIT, MVC, MVVM)
//
//  Created by Mikhail on 31.03.2021.
//

import Foundation

protocol AppViewModelProtocol {
    
    var apps: [FeedResultsApp] { get }
    func fetchAppsFree(completion: @escaping () -> Void)
    func fetchAppsPaid(completion: @escaping () -> Void)
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> AppTableViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> AppDetailViewModelProtocol?
}
