//
//  StationsListViewModel.swift
//  TransportMap
//
//  Created by Roman Zhukov on 27.02.2022.
//

import Foundation

class StationsListViewModel: StationsListViewModelProtocol {
    
    var stations: Stations?
    
    private var selectedIndexPath: IndexPath?
    
    func numberOfRows() -> Int {
        stations?.data.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> StationViewCellViewModelProtocol? {
        guard let station = stations?.data[indexPath.row] else { return nil }
        return StationViewCellViewModel(station: station)
    }
    
    func getData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let stations):
                self.stations = stations
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func viewModelForSelectedRow() -> MapViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        guard let station = stations?.data[selectedIndexPath.row] else { return nil }
        return MapViewModel(station: station)
    }
    
    func selectRow(at indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
}
