//
//  NetworkManager.swift
//  TransportMap
//
//  Created by Roman Zhukov on 26.02.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let url = "https://api.mosgorpass.ru/v8.2/stop"
    
    private init() {}
}

extension NetworkManager {
    func fetchData(completion: @escaping(Result<Stations, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(Stations.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchStationData(stationId: String, completion: @escaping(Result<StationData, NetworkError>) -> Void) {
        guard let url = URL(string: "\(url)/\(stationId)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(StationData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
