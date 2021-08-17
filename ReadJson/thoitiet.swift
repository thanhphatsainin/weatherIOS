//
//  wether.swift
//  ReadJson
//
//  Created by trần nam on 8/15/20.
//  Copyright © 2020 trần nam. All rights reserved.
//

import Foundation


struct Weather {
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
    
    init(object : Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
            if let id = dic["id"] as? Int {
                self.id = id
            }else{
                self.id = 0
            }
            if let main = dic["main"] as? String {
                self.main = main
            }else{
                self.main = ""
            }
            if let description = dic["description"] as? String {
                self.description = description
            }else{
                self.description = ""
            }
            if let icon = dic["icon"] as? String {
                self.icon = icon
            }else{
                self.icon = ""
            }
            
        }else{
            self.id = 0
            self.main = ""
            self.description = ""
            self.icon = ""
        }
    }
    func toString() {
        print(self.id,self.main, self.description, self.icon)
    }
}

struct Main {
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
    
    init(object : Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
            if let temp = dic["temp"] as? Double {
                self.temp = temp
            }else{
                self.temp = 0
            }
            if let humidity = dic["humidity"] as? Double {
                self.humidity = humidity
            }else{
                self.humidity = 0
            }
        }else{
            self.humidity = 0
            self.temp = 0
        }
    }
    
    func toString() {
        print(self.temp, self.humidity)
    }
    
}

struct Wind {
    let speed : Double
    
    init() {
        speed = 0
    }
    
    init(speed : Double) {
        self.speed = speed
    }
    
    init(object : Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
            if let speed = dic["speed"] as? Double {
                self.speed = speed
            }else{
                self.speed = 0
            }
        }else{
            self.speed = 0
        }
    }
    func toString() {
        print(self.speed)
    }
    
}

struct TimeCurrent {
    let dt : Double
    
    init() {
        dt = 0
    }
    
    init(dt : Double) {
        self.dt = dt
    }
    
    init(object : Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
            if let dt = dic["dt"] as? Double {
                self.dt = dt
            }else{
                self.dt = 0
            }
        }else{
            self.dt = 0
        }
    }
    func toString() {
        print(self.dt)
    }
}

struct City {
    let name : String
    
    init() {
        name = ""
    }
    
    init(name : String) {
        self.name = name
    }
    
    init(object : Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
            if let name = dic["name"] as? String {
                self.name = name
            }else{
                self.name = ""
            }
        }else{
            self.name = ""
        }
    }
    
    func toString() {
        print(self.name)
    }
}


struct Sys {
    let country : String
    
    init() {
        country = ""
    }
    
    init(country : String) {
        self.country = country
    }
    
    init(object : Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
            if let country = dic["country"] as? String {
                self.country = country
            }else{
                self.country = ""
            }
        }else{
            self.country = ""
        }
    }
    
    func toString() {
        print(self.country)
    }
}


//struct thoitiet : Decodable {
//    var coord : Coord
//    var weather : [Weather]
//    var base : String
//    var main : Main
//    var visibility : Double
//    var wind : Wind
//    var rain : Rain
//    var clouds : Clouds
//    var dt : CLong
//    var sys : Sys
//    var timezone : Int
//    var id : Int
//    var name : String
//    var cod : Double
//    
//    init(coord : Coord, weather : [Weather], base : String, main : Main, visibility : Double, wind : Wind,
//         rain : Rain, clouds : Clouds, dt : CLong, sys : Sys, timezone : Int, id : Int, name : String, cod : Double) {
//        self.coord = coord
//        self.weather = weather
//        self.base = base
//        self.main = main
//        self.visibility = visibility
//        self.wind = wind
//        self.rain = rain
//        self.clouds = clouds
//        self.dt = dt
//        self.sys = sys
//        self.timezone = timezone
//        self.id = id
//        self.name = name
//        self.cod = cod
//        self.rain = rain
//    }
//    
//    init?(JSON : [String : AnyObject]) {
//        guard let coord = JSON["coord"] as? Coord else { return nil }
//        guard let weather = JSON["weather"] as? [Weather] else { return nil }
//        guard let base = JSON["base"] as? String else { return nil }
//        guard let main = JSON["main"] as? Main else { return nil }
//        guard let visibility = JSON["visibility"] as? Double else { return nil }
//        guard let wind = JSON["wind"] as? Wind else { return nil }
//        guard let rain = JSON["rain"] as? Rain else { return nil }
//        guard let clouds = JSON["clouds"] as? Clouds else { return nil }
//        guard let dt = JSON["dt"] as? CLong else { return nil }
//        guard let sys = JSON["sys"] as? Sys else { return nil }
//        guard let timezone = JSON["timezone"] as? Int else { return nil }
//        guard let id = JSON["id"] as? Int else { return nil }
//        guard let name = JSON["name"] as? String else { return nil }
//        guard let cod = JSON["cod"] as? Double else { return nil }
//        
//        
//        self.coord = coord
//        self.weather = weather
//        self.base = base
//        self.main = main
//        self.visibility = visibility
//        self.wind = wind
//        //self.rain = rain
//        self.clouds = clouds
//        self.dt = dt
//        self.sys = sys
//        self.timezone = timezone
//        self.id = id
//        self.name = name
//        self.cod = cod
//        self.rain = rain
//    }
//    
//}


