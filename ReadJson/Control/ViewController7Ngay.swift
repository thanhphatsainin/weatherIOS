//
//  ViewController7Ngay.swift
//  ReadJson
//
//  Created by trần nam on 8/11/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import UIKit

class ViewController7Ngay: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var UINavigationItemClass: UINavigationItem!
    var thoitiet7ngay = ThoiTiet7ngay()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
//        dump(thoitiet7ngay)
//        print(thoitiet7ngay.list.count)
    }
}

extension ViewController7Ngay : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoitiet7ngay.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableViewCellWeather
        cell.khoitao(item: thoitiet7ngay.list[indexPath.row])
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        cell.view.layer.cornerRadius = cell.view.frame.height/3
        cell.img.layer.cornerRadius = cell.img.frame.height/3
        return cell
    }
    
    // animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.5, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
            },completion: { finished in
                UIView.animate(withDuration: 0.2, animations: {
                    cell.layer.transform = CATransform3DMakeScale(1,1,1)
                })
        })
    }
    
}
