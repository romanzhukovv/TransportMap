//
//  StationViewCell.swift
//  TransportMap
//
//  Created by Roman Zhukov on 27.02.2022.
//

import UIKit

class StationViewCell: UITableViewCell {
    @IBOutlet var nameStation: UILabel!
    
    var cellViewModel: StationViewCellViewModelProtocol? {
        willSet(cellViewModel) {
            guard let cellViewModel = cellViewModel else { return }
            nameStation.text = cellViewModel.nameStation
        }
    }
}
