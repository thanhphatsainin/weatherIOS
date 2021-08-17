//
//  wether.swift
//  ReadJson
//
//  Created by trần nam on 8/15/20.
//  Copyright © 2020 trần nam. All rights reserved.
//

import Foundation

// thoi tiet trong ngay
struct Weather : Codable {
    let id : Int
    let main : String
    let description : String
    let icon : String
    
    init() {
        id = 0
        main = ""
        description = ""
        icon = ""
    }
    
    init(id : Int, main : String, description : String, icon : String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
    
    func toString() {
        print(self.id,self.main, self.description, self.icon)
    }
}

struct Main : Codable {
    let temp : Double
    let humidity : Double
    
    init() {
        temp = 0
        humidity = 0
    }
    
    init(temp : Double, humidity : Double) {
        self.temp = temp
        self.humidity = humidity
    }
    
    
    func toString() {
        print(self.temp, self.humidity)
    }
    
}

struct Wind : Codable {
    let speed : Double
    
    init() {
        speed = 0
    }
    
    init(speed : Double) {
        self.speed = speed
    }
    
    func toString() {
        print(self.speed)
    }
    
}

struct Sys : Codable {
    let country : String
    
    init() {
        country = ""
    }
    
    init(country : String) {
        self.country = country
    }
    
    func toString() {
        print(self.country)
    }
}


struct ThoiTiet : Codable {
    var weather : [Weather]
    var main : Main
    var wind : Wind
    var dt : CLong
    var sys : Sys
    var name : String
    
    init() {
        weather = []
        main = Main()
        wind = Wind()
        dt = 0
        sys = Sys()
        name = ""
    }

    init(weather : [Weather], main : Main, wind : Wind, dt : CLong, sys : Sys, name : String) {
        self.weather = weather
        self.main = main
        self.wind = wind
        self.dt = dt
        self.sys = sys
        self.name = name
    }
    
}


// -------*----------
struct ThoiTiet7ngay: Decodable {
    var list: [Weather2]
    var city : City
    
    init() {
        list = []
        city = City()
    }
}

struct City : Decodable {
    let name : String
    let country : String
    
    init() {
        name = ""
        country = ""
    }
}

// thoi tiet 7 ngay (k su dung cai thoi tiet 1 ngay dc vi da thay doi 1 so cai)
struct Weather2: Decodable {
    var weather : [Weather]
    var main : Main
    var wind : Wind
    var dt : CLong
    
    init() {
        weather = []
        main = Main()
        wind = Wind()
        dt = 0
    }
}
