//
//  Network.swift
//  ReadJson
//
//  Created by trần nam on 8/18/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import Foundation

struct Network {

    static let shared = Network()
    
    private init() { }
    
    private let baseUrl = "http://api.openweathermap.org/data/2.5"
    
    func getThoiTietThanhPhoHienTai(nameCity : String) -> String {        
        return "\(baseUrl)/weather?q=\(nameCity)&units=metric&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR3EPqOFaRuG_Zc81YAygpzE8W3B3Cd650tJ5DDCkcm-3A1ab4xkCi5TDMs"
    }
    
    func getThoiTietThanhPho6Ngay(nameCity: String) -> String {
        return "\(baseUrl)/forecast?q=\(nameCity)&appid=5667e18f3836363f6926165a15043cc5"
    }
    
}

enum NetworkError: Error {
    case badURL
}
