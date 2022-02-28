//
//  RoutePath.swift
//  TransportMap
//
//  Created by Roman Zhukov on 28.02.2022.
//

import Foundation

struct StationData: Decodable {
    let name: String
    let routePath: [RoutePath]
}

struct RoutePath: Decodable {
    let number: String
    let timeArrival: [String]
}
