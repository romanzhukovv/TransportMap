//
//  RoutesListViewModelProtocol.swift
//  TransportMap
//
//  Created by Roman Zhukov on 28.02.2022.
//

import Foundation

protocol RoutesListViewModelProtocol {
    var name: String { get }
    var routePath: [RoutePath] { get }
    
    func numberOfRows() -> Int
    func getStationData(completion: @escaping() -> Void)
}
