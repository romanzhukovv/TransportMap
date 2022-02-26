//
//  StationListViewController.swift
//  TransportMap
//
//  Created by Roman Zhukov on 26.02.2022.
//

import UIKit

class StationsListViewController: UITableViewController {

    private var stations: Stations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations?.data.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stationCell", for: indexPath)
        let station = stations?.data[indexPath.row]
        cell.textLabel?.text = "\(station?.name ?? "")"

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StationsListViewController {
    private func getData() {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let stations):
                self.stations = stations
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
