//
//  MapViewModel.swift
//  TransportMap
//
//  Created by Roman Zhukov on 27.02.2022.
//

import Foundation

class MapViewModel: MapViewModelProtocol {
    
    private var station: Station
    
    var latitude: Double {
        station.lat
    }
    
    var longitude: Double {
        station.lon
    }
    
    var name: String {
        station.name ?? ""
    }
    
    init(station: Station) {
        self.station = station
    }
    
    func viewModelForRoutesList() -> RoutesListViewModelProtocol? {
        RoutesListViewModel(station: station)
    }
}
