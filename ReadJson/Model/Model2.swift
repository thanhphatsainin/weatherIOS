////
////  wether.swift
////  ReadJson
////
////  Created by trần nam on 8/15/20.
////  Copyright © 2020 trần nam. All rights reserved.
////
//
//import Foundation
//
//
//struct Weather {
//    let id : Int
//    let main : String
//    let description : String
//    let icon : String
//    
//    init() {
//        id = 0
//        main = ""
//        description = ""
//        icon = ""
//    }
//    
//    init(id : Int, main : String, description : String, icon : String) {
//        self.id = id
//        self.main = main
//        self.description = description
//        self.icon = icon
//    }
//    
//    init(object : Any) {
//        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
//            if let id = dic["id"] as? Int {
//                self.id = id
//            }else{
//                self.id = 0
//            }
//            if let main = dic["main"] as? String {
//                self.main = main
//            }else{
//                self.main = ""
//            }
//            if let description = dic["description"] as? String {
//                self.description = description
//            }else{
//                self.description = ""
//            }
//            if let icon = dic["icon"] as? String {
//                self.icon = icon
//            }else{
//                self.icon = ""
//            }
//            
//        }else{
//            self.id = 0
//            self.main = ""
//            self.description = ""
//            self.icon = ""
//        }
//    }
//    func toString() {
//        print(self.id,self.main, self.description, self.icon)
//    }
//}
//
//struct Main {
//    let temp : Double
//    let humidity : Double
//    
//    init() {
//        temp = 0
//        humidity = 0
//    }
//    
//    init(temp : Double, humidity : Double) {
//        self.temp = temp
//        self.humidity = humidity
//    }
//    
//    init(object : Any) {
//        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
//            if let temp = dic["temp"] as? Double {
//                self.temp = temp
//            }else{
//                self.temp = 0
//            }
//            if let humidity = dic["humidity"] as? Double {
//                self.humidity = humidity
//            }else{
//                self.humidity = 0
//            }
//        }else{
//            self.humidity = 0
//            self.temp = 0
//        }
//    }
//    
//    func toString() {
//        print(self.temp, self.humidity)
//    }
//    
//}
//
//struct Wind {
//    let speed : Double
//    
//    init() {
//        speed = 0
//    }
//    
//    init(speed : Double) {
//        self.speed = speed
//    }
//    
//    init(object : Any) {
//        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
//            if let speed = dic["speed"] as? Double {
//                self.speed = speed
//            }else{
//                self.speed = 0
//            }
//        }else{
//            self.speed = 0
//        }
//    }
//    func toString() {
//        print(self.speed)
//    }
//    
//}
//
////struct TimeCurrent {
////    let dt : CLong
////
////    init() {
////        dt = 0
////    }
////
////    init(dt : CLong) {
////        self.dt = dt
////    }
////
////    init(object : Any) {
////        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
////            if let dt = dic["dt"] as? CLong {
////                self.dt = dt
////            }else{
////                self.dt = 0
////            }
////        }else{
////            self.dt = 0
////        }
////    }
////    func toString() {
////        print(self.dt)
////    }
////}
//
////struct City {
////    let name : String
////
////    init() {
////        name = ""
////    }
////
////    init(name : String) {
////        self.name = name
////    }
////
////    init(object : Any) {
////        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
////            if let name = dic["name"] as? String {
////                self.name = name
////            }else{
////                self.name = ""
////            }
////        }else{
////            self.name = ""
////        }
////    }
////
////    func toString() {
////        print(self.name)
////    }
////}
//
//
//struct Sys {
//    let country : String
//    
//    init() {
//        country = ""
//    }
//    
//    init(country : String) {
//        self.country = country
//    }
//    
//    init(object : Any) {
//        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
//            if let country = dic["country"] as? String {
//                self.country = country
//            }else{
//                self.country = ""
//            }
//        }else{
//            self.country = ""
//        }
//    }
//    
//    func toString() {
//        print(self.country)
//    }
//}
//
//
//struct ThoiTiet {
//    var weather : [Weather]
//    var main : Main
//    var wind : Wind
//    var dt : CLong
//    var sys : Sys
//    var city : String
//    
//    init() {
//        weather = []
//        main = Main()
//        wind = Wind()
//        dt = 0
//        sys = Sys()
//        city = ""
//    }
//
//    init(weather : [Weather], main : Main, wind : Wind, dt : CLong, sys : Sys, city : String) {
//        self.weather = weather
//        self.main = main
//        self.wind = wind
//        self.dt = dt
//        self.sys = sys
//        self.city = city
//    }
//    
//    init(object : Any) {
//        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
//            if let weather = dic["weather"] as? [Weather] {
//                self.weather = weather
//            }else{
//                self.weather = []
//            }
//            if let main = dic["main"] as? Main {
//                self.main = main
//            }else{
//                self.main = Main()
//            }
//            if let wind = dic["wind"] as? Wind {
//                self.wind = Wind(object: wind)
//            }else{
//                self.wind = Wind()
//            }
//            if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{
//                if let dt = dic["dt"] as? CLong {
//                    self.dt = dt
//                }else{
//                    self.dt = 0
//                }
//            }else{
//                self.dt = 0
//            }
//            if let sys = dic["sys"] as? Sys {
//                self.sys = sys
//            }else{
//                self.sys = Sys()
//            }
//            if let city = dic["name"] as? String {
//                self.city = city
//            }else{
//                self.city = ""
//            }
//            
//        }else{
//            self.weather = []
//            self.main = Main()
//            self.wind = Wind()
//            self.dt = 0
//            self.sys = Sys()
//            self.city = ""
//        }
//    }
//}
//
//struct ThoiTiet7Ngay {
//    var weather : [Weather]
//    var main : Main
//    var wind : Wind
//    var dt : CLong
//    var sys : Sys
//    var city : String
//    
//    init() {
//        weather = []
//        main = Main()
//        wind = Wind()
//        dt = 0
//        sys = Sys()
//        city = ""
//    }
//
//    init(weather : [Weather], main : Main, wind : Wind, dt : CLong, sys : Sys, city : String) {
//        self.weather = weather
//        self.main = main
//        self.wind = wind
//        self.dt = dt
//        self.sys = sys
//        self.city = city
//    }
//    
//    
//}
//
//
//
//
