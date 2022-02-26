//
//  Station.swift
//  TransportMap
//
//  Created by Roman Zhukov on 26.02.2022.
//

struct Stations: Decodable {
    let data: [Station]
}

struct Station: Decodable {
    let id: String
    let name: String?
    
    let lat: Double
    let lon: Double
}
