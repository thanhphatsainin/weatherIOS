//
//  TableViewCellWeather.swift
//  ReadJson
//
//  Created by trần nam on 8/11/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCellWeather: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var mainLB: UILabel!
    @IBOutlet weak var humidityLB: UILabel!
    @IBOutlet weak var speedLB: UILabel!
    @IBOutlet weak var tempLB: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func khoitao(item : Weather2) {
//        let queue = DispatchQueue(label: "load Image")
//        queue.async {
//            DispatchQueue.main.async {
//                let urlString = "http://openweathermap.org/img/wn/" + item.weather[0].icon + ".png"
//                let url = URL(string: urlString)
//                let data = try! Data(contentsOf: url!)
//                self.img.image = UIImage(data: data)
//
//            }
//        }
        let urlString = "http://openweathermap.org/img/wn/" + item.weather[0].icon + ".png"
        let url = URL(string: urlString)
        let queue = DispatchQueue(label: "load Image")
        queue.async {
            DispatchQueue.main.async {
                self.img.sd_setImage(with: url,
                                       placeholderImage: UIImage(systemName: "photo"),
                                       options: .continueInBackground,
                                       completed: nil)
            }
        }
        
        // thoi gian
        let dateFormatCoordinate = DateFormatter()
        dateFormatCoordinate.dateFormat = "EEEE yyyy-MM-dd HH:mm:ss"
        let time = item.dt
        let timeInterval = TimeInterval(time)
        let date = NSDate( timeIntervalSince1970: timeInterval)
        self.timeLB.text = dateFormatCoordinate.string(from: date as Date)
        
        self.mainLB.text = item.weather[0].main
        self.humidityLB.text = String(item.main.humidity) + "%"
        self.tempLB.text = String(item.main.temp) + "'C"
        self.speedLB.text = String(item.wind.speed) + " m/s"
        
    }

}
