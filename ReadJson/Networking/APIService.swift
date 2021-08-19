//
//  APIService.swift
//  ReadJson
//
//  Created by trần nam on 8/18/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import Foundation

class APIService {
    private init() {}
    
    static let shared = APIService()
    
    func pullJSONData(url: URL?, completion: @escaping (Result<Data, NetworkError>) -> Void){
        guard let url = url else {
            completion(.failure(.badURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error : HTTP Response Code Error")
                return
            }
            
            guard let data = data else {
                print("Error : No Response")
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
