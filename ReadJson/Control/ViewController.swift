//
//  ViewController.swift
//  ReadJson
//
//  Created by trần nam on 8/15/20.
//  Copyright © 2020 trần nam. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var searchCity: UISearchBar!
    @IBOutlet weak var lableCity: UILabel!
    @IBOutlet weak var lableCountry: UILabel!
    @IBOutlet weak var imgICon: UIImageView!
    @IBOutlet weak var lableMain: UILabel!
    @IBOutlet weak var lableNhietDo: UILabel!
    @IBOutlet weak var lableDoAm: UILabel!
    @IBOutlet weak var lableGio: UILabel!
    
    @IBOutlet weak var lableTime: UILabel!
    @IBOutlet weak var btn7ngay: UIButton!
    var city : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn7ngay.layer.cornerRadius = 15
        
        
        //c1
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Hanoi&units=metric&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR3EPqOFaRuG_Zc81YAygpzE8W3B3Cd650tJ5DDCkcm-3A1ab4xkCi5TDMs")
        pullJSONData(url: url, forecast: false)
        
        //cach 2 : dai hon
//        let urlString  =  "http://api.openweathermap.org/data/2.5/weather?q=Hanoi&units=metric&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR3EPqOFaRuG_Zc81YAygpzE8W3B3Cd650tJ5DDCkcm-3A1ab4xkCi5TDMs"
//        requestJson(url: urlString)
        
    }
    
    
    @IBAction func click_btnTim(_ sender: UIButton) {
        city = searchCity.text ?? "Hanoi"
        city = city.trimmingCharacters(in: .whitespaces)// bo space
        
        //c1
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=metric&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR3EPqOFaRuG_Zc81YAygpzE8W3B3Cd650tJ5DDCkcm-3A1ab4xkCi5TDMs")
        pullJSONData(url: url, forecast: false)
        
        
        //        cach 2
//        let urlString  =  "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=metric&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR3EPqOFaRuG_Zc81YAygpzE8W3B3Cd650tJ5DDCkcm-3A1ab4xkCi5TDMs"
        //        requestJson(url : urlString)
    }
    
    @IBAction func clickThoiTiet7ngay(_ sender: Any) {
        city = searchCity.text ?? "Hanoi"
        city = city.trimmingCharacters(in: .whitespaces)// bo space
//        let urlString  =  "http://api.openweathermap.org/data/2.5/forecast?q=hanoi&units=metric&cnt=7&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR0rHWe8SrxYvMCEC5q4QnCJFEFpyo8EMahDwLrmbv7vV_PPbfRo6dhVQEY"
        
        //api 6 ngay, moi ngay 8 lan, moi lan cach nhau 3 tieng
//        let urlString = "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=5667e18f3836363f6926165a15043cc5"
        
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=5667e18f3836363f6926165a15043cc5"
        let url = URL(string: urlString)
        pullJSONData(url: url, forecast: true)
        
    }
    
    func decodeJSONData(JSONData: Data){
        do{
            let weatherData = try? JSONDecoder().decode(ThoiTiet.self, from: JSONData)
            if let weatherData = weatherData{
                var thoitiet = ThoiTiet()
                thoitiet.main = weatherData.main
                thoitiet.weather = weatherData.weather
                thoitiet.wind = weatherData.wind
                thoitiet.dt = weatherData.dt
                thoitiet.sys = weatherData.sys
                thoitiet.name = weatherData.name

                DispatchQueue.main.async { // Correct
                    self.lableCity.text = thoitiet.name
                    self.lableCountry.text = thoitiet.sys.country
                    if(thoitiet.weather.count == 0){
                        let alter = UIAlertController(title: "Thong bao", message: "Ban nhap k dung ten thanh pho!", preferredStyle: .alert)
                        let actionOk = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                        }
                        alter.addAction(actionOk)
                        self.present(alter, animated: true, completion: nil)
                    }
                    else{
                        let urlString = "http://openweathermap.org/img/wn/" + thoitiet.weather[0].icon + ".png"
                        let url = URL(string: urlString)
                        self.imgICon.sd_setImage(with: url,
                                               placeholderImage: UIImage(systemName: "photo"),
                                               options: .continueInBackground,
                                               completed: nil)
                        self.lableMain.text = thoitiet.weather[0].main
                        self.lableNhietDo.text = String(thoitiet.main.temp) + "'C"
                        self.lableDoAm.text = String(thoitiet.main.humidity) + "%"
                        self.lableGio.text = String(thoitiet.wind.speed) + " m/s"

                        // thoi gian
                        let dateFormatCoordinate = DateFormatter()
                        dateFormatCoordinate.dateFormat = "EEEE yyyy-MM-dd HH:mm:ss"

                        let time = thoitiet.dt
                        let timeInterval = TimeInterval(time)
                        let date = NSDate( timeIntervalSince1970: timeInterval)
                        self.lableTime.text = dateFormatCoordinate.string(from: date as Date)
                    }
                }
            }
        }
    }

    // thoi tiet 3 tieng (7 lan)
    func decodeJSONForecast(JSONData: Data){
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
//        dump(thoitiet7ngay)
//        // test tg
//        for i in thoitiet7ngay.list {
//            let dateFormatCoordinate = DateFormatter()
//            dateFormatCoordinate.dateFormat = "EEEE yyyy-MM-dd HH:mm:ss"
//
//            let time = i.dt
//            let timeInterval = TimeInterval(time)
//            let date = NSDate( timeIntervalSince1970: timeInterval)
//            print(dateFormatCoordinate.string(from: date as Date))
//        }
        DispatchQueue.main.async{
            let MH7NGAY = self.storyboard?.instantiateViewController(identifier: "MH7NGAY") as! ViewController7Ngay
            MH7NGAY.thoitiet7ngay = thoitiet7ngay
            MH7NGAY.UINavigationItemClass.title = self.city
            self.navigationController?.pushViewController(MH7NGAY, animated: true)
        }
    }

    func pullJSONData(url: URL?, forecast: Bool){
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
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
            
            if (!forecast){
                self.decodeJSONData(JSONData: data)
            } else {
                self.decodeJSONForecast(JSONData: data)
            }
        }
        task.resume()
    }
    
    
    //    cach 2 su dung Model2
    //    func requestJson(url : String) {
    //        let url = URL(string : url)
    //        let session = URLSession.shared
    //        session.dataTask(with : url!) { (data, res, erro) in
    //            if erro == nil && data != nil{
    //                do {
    //                    if let result : Dictionary<String,Any> = try JSONSerialization.jsonObject(with : data!, options : JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any>{
    //                        var thoitiet = ThoiTiet()
    //                        var arrayWeather : Array<Weather> = []
    //                        if let items : Array<Any> = result["weather"] as? Array<Any>{
    //                            for i in items {
    //                                let weather = Weather(object : i)
    //                                arrayWeather.append(weather)
    //                            }
    //                            thoitiet.weather = arrayWeather
    //                        }
    //
    //                        if let mai : Any = result["main"]{
    //                            var main : Main = Main()
    //                            main = Main(object: mai)
    //                            thoitiet.main = main
    //                        }
    //                        if let win : Any = result["wind"]{
    //                            var wind : Wind = Wind()
    //                            wind = Wind(object: win)
    //                            thoitiet.wind = wind
    //                        }
    //                        if let cit : Any = result["name"]{
    //                            thoitiet.city = cit as! String
    //                        }
    //                        if let sy : Any = result["sys"]{
    //                            var sys : Sys = Sys()
    //                            sys = Sys(object: sy)
    //                            thoitiet.sys = sys
    //                        }
    //                        if let dt : Any = result["dt"]{
    //                            thoitiet.dt = dt as! CLong
    //                        }
    ////                        dump(thoitiet)
    //                        DispatchQueue.main.async { // Correct
    //                            self.lableCity.text = thoitiet.city
    //                            self.lableCountry.text = thoitiet.sys.country
    //                            if(thoitiet.weather.count == 0){
    //                                let alter = UIAlertController(title: "Thong bao", message: "Ban nhap k dung ten thanh pho!", preferredStyle: .alert)
    //                                let actionOk = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
    //                                }
    //                                alter.addAction(actionOk)
    //                                self.present(alter, animated: true, completion: nil)
    //                            }
    //                            else{
    //                                let urlString = "http://openweathermap.org/img/wn/" + thoitiet.weather[0].icon + ".png"
    //                                let url = URL(string: urlString)
    //                                let data = try! Data(contentsOf: url!)
    //                                self.imgICon.image = UIImage(data: data)
    //                                self.lableMain.text = thoitiet.weather[0].main
    //                                self.lableNhietDo.text = String(thoitiet.main.temp) + "'C"
    //                                self.lableDoAm.text = String(thoitiet.main.humidity) + "%"
    //                                self.lableGio.text = String(thoitiet.wind.speed) + " m/s"
    //
    //                                // thoi gian
    //                                let dateFormatCoordinate = DateFormatter()
    //                                dateFormatCoordinate.dateFormat = "EEEE yyyy-MM-dd HH:mm:ss"
    //
    //                                let time = thoitiet.dt
    //                                let timeInterval = TimeInterval(time)
    //                                let date = NSDate( timeIntervalSince1970: timeInterval)
    //                                self.lableTime.text = dateFormatCoordinate.string(from: date as Date)
    //                            }
    //
    //                        }
    //                    }
    //
    //                } catch  {
    //                }
    //            }
    //        }.resume()
    //    }

}

// api 3 tieng (7 lan) http://api.openweathermap.org/data/2.5/forecast?q=hanoi&units=metric&cnt=7&appid=5667e18f3836363f6926165a15043cc5&fbclid=IwAR0rHWe8SrxYvMCEC5q4QnCJFEFpyo8EMahDwLrmbv7vV_PPbfRo6dhVQEY


