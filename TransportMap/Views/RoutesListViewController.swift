//
//  RouteListViewController.swift
//  TransportMap
//
//  Created by Roman Zhukov on 28.02.2022.
//

import UIKit

class RoutesListViewController: UIViewController {
    @IBOutlet var nameStationLabel: UILabel!
    @IBOutlet var routesTableView: UITableView!
    
    var routesListViewModel: RoutesListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routesListViewModel?.getStationData {
            self.routesTableView.reloadData()
        }
        nameStationLabel.text = routesListViewModel?.name
    }
}

extension RoutesListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        routesListViewModel?.numberOfRows() ?? 0
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = routesTableView.dequeueReusableCell(withIdentifier: "routeCell", for: indexPath)
        let routhPath = routesListViewModel?.routePath[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: "bus.fill")
        content.text = routhPath?.number
        content.secondaryText = routhPath?.timeArrival.joined(separator: " ")
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
