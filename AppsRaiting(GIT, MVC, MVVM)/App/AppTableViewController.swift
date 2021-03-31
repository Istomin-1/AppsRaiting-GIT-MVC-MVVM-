//
//  AppTableViewController.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import UIKit

class AppTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var viewModel: AppViewModelProtocol! {
        didSet {
            viewModel.fetchAppsFree {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet private var raitingAppsSegmentedControl: UISegmentedControl!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        viewModel = AppViewModel()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellApp", for: indexPath) as! AppTableViewCell
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        
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
            viewModel.fetchAppsFree {
                self.tableView.reloadData()
            }
        case 1:
            viewModel.fetchAppsPaid {
                self.tableView.reloadData()
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
        let detailVC = segue.destination as! AppDetailViewController
        viewModel.selectedRow(for: indexPath)
        detailVC.viewModel = viewModel.viewModelForSelectedRow()
    }
}




