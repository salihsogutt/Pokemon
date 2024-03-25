//
//  NetworkManager.swift
//  Pokemon
//
//  Created by salih söğüt on 22.03.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func fetch<T:Codable>(
        endpoint: String,
        method: HTTPMethod,
        type: T.Type,
        addBaseUrl: Bool = true,
        completion: @escaping (Result<T,Error>) -> Void) {
            var apiURL: String
            if addBaseUrl {
                apiURL = "https://pokeapi.co/api/v2/" + endpoint
            } else {
                apiURL =  endpoint
            }
            AF.request(apiURL, method: method).response { response in
                if let data = response.data {
                    do {
                        let json = try JSONDecoder().decode(type, from: data)
                        completion(.success(json))
                    } catch (let error) {
                        completion(.failure(error))
                    }
                }else{
                    print("Data is null")
                }
            }
        }
}
