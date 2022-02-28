//
//  RoutesListViewModel.swift
//  TransportMap
//
//  Created by Roman Zhukov on 28.02.2022.
//

import Foundation

class RoutesListViewModel: RoutesListViewModelProtocol {
    
    
    var stationData: StationData?
    private var station: Station
    
    var name: String {
        station.name ?? ""
    }
    
    var routePath: [RoutePath] {
        guard let routePath = stationData?.routePath else { return []}
        return routePath
    }
    
    init(station: Station) {
        self.station = station
    }
    
    func numberOfRows() -> Int {
        stationData?.routePath.count ?? 0
    }
    
    func getStationData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchStationData(stationId: station.id) { result in
            switch result {
            case .success(let stationData):
                self.stationData = stationData
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
