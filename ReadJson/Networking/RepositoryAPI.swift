//
//  RepositoryAPI.swift
//  ReadJson
//
//  Created by trần nam on 8/18/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import Foundation

class RepositoryAPI {
    
    func getThoiTiet(nameCity : String, completion: @escaping (Result<ThoiTiet, NetworkError>) -> Void){
        APIService.shared.pullJSONData(url: URL(string: Network.shared.getThoiTietThanhPhoHienTai(nameCity: nameCity))) { (result) in
            switch result {
            case .success(let JSONData):
                let weatherData = try? JSONDecoder().decode(ThoiTiet.self, from: JSONData)
                if let weatherData = weatherData{
                    var thoitiet = ThoiTiet()
                    thoitiet.main = weatherData.main
                    thoitiet.weather = weatherData.weather
                    thoitiet.wind = weatherData.wind
                    thoitiet.dt = weatherData.dt
                    thoitiet.sys = weatherData.sys
                    thoitiet.name = weatherData.name
                    completion(.success(thoitiet))
                }
            case .failure(.badURL):
                completion(.failure(.badURL))
            }
        }
    }
    
    func getThoiTiet6Ngay(nameCity : String, completion: @escaping (Result<ThoiTiet7ngay, NetworkError>) -> Void){
        APIService.shared.pullJSONData(url: URL(string: Network.shared.getThoiTietThanhPho6Ngay(nameCity: nameCity))) { (result) in
            switch result {
            case .success(let JSONData):
                var list : [Weather2] = []
                var thoitiet7ngay = ThoiTiet7ngay()
                let response = try! JSONDecoder().decode(ThoiTiet7ngay.self, from: JSONData)
                for i in response.list {
                    var weather2 = Weather2()
                    weather2 = i
                    list.append(weather2)
                    let city = response.city
                    thoitiet7ngay.list = list
                    thoitiet7ngay.city = city
                }
                completion(.success(thoitiet7ngay))
            case .failure(.badURL):
                completion(.failure(.badURL))
            }
        }
    }
}
