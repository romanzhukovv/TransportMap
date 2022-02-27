//
//  StationListViewController.swift
//  TransportMap
//
//  Created by Roman Zhukov on 26.02.2022.
//

import UIKit

class StationsListViewController: UITableViewController {
    private var stationsListViewModel = StationsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationsListViewModel.getData {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stationsListViewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stationCell", for: indexPath) as? StationViewCell
        
        guard let stationViewCell = cell else { return UITableViewCell() }
        
        let cellViewModel = stationsListViewModel.cellViewModel(for: indexPath)
        stationViewCell.cellViewModel = cellViewModel
        
        return stationViewCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        stationsListViewModel.selectRow(at: indexPath)
        
        performSegue(withIdentifier: "showMap", sender: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as! MapViewController
        mapVC.mapViewModel = stationsListViewModel.viewModelForSelectedRow()
    }
}


