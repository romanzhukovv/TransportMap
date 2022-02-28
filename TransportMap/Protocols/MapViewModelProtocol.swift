//
//  MapViewModelProtocol.swift
//  TransportMap
//
//  Created by Roman Zhukov on 27.02.2022.
//

import Foundation

protocol MapViewModelProtocol {
    var latitude: Double { get }
    var longitude: Double { get }
    var name: String { get }
    
    func viewModelForRoutesList() -> RoutesListViewModelProtocol?
}
