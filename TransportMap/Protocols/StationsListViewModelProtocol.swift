//
//  StationsListViewModelProtocol.swift
//  TransportMap
//
//  Created by Roman Zhukov on 27.02.2022.
//

import Foundation

protocol StationsListViewModelProtocol {
    func numberOfRows() -> Int
    func getData(completion: @escaping() -> Void)
    
    func cellViewModel(for indexPath: IndexPath) -> StationViewCellViewModelProtocol?
    func viewModelForSelectedRow() -> MapViewModelProtocol?
    func selectRow(at indexPath: IndexPath)
}
