//
//  AppTableViewController.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import UIKit

class AppTableViewController: UITableViewController {
    
    // MARK: - Properties
    let appFreeURL = "https://rss.itunes.apple.com/api/v1/ru/ios-apps/top-free/all/10/explicit.json"
    let appPaidURL = "https://rss.itunes.apple.com/api/v1/ru/ios-apps/top-paid/all/10/explicit.json"
    
    private var apps: [FeedResultsApp] = []
    var networkManager = NetworkManager()
    
    @IBOutlet private var raitingAppsSegmentedControl: UISegmentedControl!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getApps()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellApp", for: indexPath) as! AppTableViewCell
        let app = apps[indexPath.row]
        cell.configure(wit: app)
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Update interface
    private func getApps() {
        switch raitingAppsSegmentedControl.selectedSegmentIndex {
        case 0:
            networkManager.dataFetcher(stringUrl: appFreeURL) { apps in
                self.apps = apps
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        case 1:
            networkManager.dataFetcher(stringUrl: appPaidURL) { apps in
                self.apps = apps
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        default: break
        }
    }
    
    @IBAction private func changeSegment() {
        getApps()
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let app = apps[indexPath.row]
        let detailVC = segue.destination as! AppDetailViewController
        detailVC.app = app
    }
}




