//
//  ViewController7Ngay.swift
//  ReadJson
//
//  Created by trần nam on 8/11/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController7Ngay: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var UINavigationItemClass: UINavigationItem!
    var thoitiet7ngay = ThoiTiet7ngay()
    
    // number of items to be fetched each time (i.e., database LIMIT)
    let itemsPerBatch = 50

    // Where to start fetching items (database OFFSET)
    var offset = 0

    // a flag for when all database items have already been loaded
    var reachedEndOfItems = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        dump(thoitiet7ngay)
        print(thoitiet7ngay.list.count)
        // Do any additional setup after loading the view.
    }
    
//    func loadMore() {
//        // don't bother doing another db query if already have everything
//        guard !self.reachedEndOfItems else {
//            return
//        }
//
//        // query the db on a background thread
//        DispatchQueue.global(qos: .background).async {
//
//            // determine the range of data items to fetch
//            let thisBatchOfItems: [Weather2]? = self.thoitiet7ngay.list
//
//            // update UITableView with new batch of items on main thread after query finishes
//            DispatchQueue.main.async {
//
//                if let newItems = thisBatchOfItems {
//
//                    // append the new items to the data source for the table view
//                    self.thoitiet7ngay.list.append(contentsOf: newItems)
//
//                    // reload the table view
//                    self.myTable.reloadData()
//
//                    // check if this was the last of the data
//                    if newItems.count < self.itemsPerBatch {
//                        self.reachedEndOfItems = true
//                        print("reached end of data. Batch count: \(newItems.count)")
//                    }
//
//                    // reset the offset for the next data query
//                    self.offset += self.itemsPerBatch
//                }
//
//            }
//        }
//    }

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
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//
//        // UITableView only moves in one direction, y axis
//        let currentOffset = scrollView.contentOffset.y
//        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
//
//        // Change 10.0 to adjust the distance from bottom
//        if maximumOffset - currentOffset <= 10.0 {
//            self.loadMore()
//        }
//    }
    
    
    
    
}
