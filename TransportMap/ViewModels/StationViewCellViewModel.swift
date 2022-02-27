//
//  StationViewCellViewModel.swift
//  TransportMap
//
//  Created by Roman Zhukov on 27.02.2022.
//

import Foundation

class StationViewCellViewModel: StationViewCellViewModelProtocol {
    private var station: Station
    
    var nameStation: String {
        station.name ?? ""
    }
    
    init(station: Station) {
        self.station = station
    }
}
