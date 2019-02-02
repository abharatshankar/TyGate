//
//  jobVC.swift
//  tygate
//
//  Created by Bharat shankar on 24/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit
import SJSegmentedScrollView
let webserviceController = WebserviceController.init()

class jobVC: UIViewController ,UITableViewDelegate , UITableViewDataSource ,CAAnimationDelegate{

    @IBOutlet weak var tablViw: UITableView!
    var selectedIndex : Int = 0
    var selectedItems = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.tablViw.separatorStyle = .none
        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        self.tablViw.addGestureRecognizer(leftSwipe)
        
    }
    
    
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
            print("Swipe Left")
            
            let imageDataDict:[String: String] = ["id": "recent", "from":"notificationName"]
            // post a notification
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)
            
            
        }
        
        if (sender.direction == .right) {
            print("Swipe Right")
            
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView{
            statusBar.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = false
    }
    
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let cell : nearByCellTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "nearByCellTableViewCell", for: indexPath) as? nearByCellTableViewCell)!
        
   webserviceController.shadowView(view:  cell.cellView)
        // cell.textLabel?.text = "Row " + String((indexPath as NSIndexPath).row)
        cell.favBtn.addTarget(self, action: #selector(favButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
        
        cell.favBtn.tag = indexPath.row
        if (selectedItems.contains(indexPath.row)) {
            
            cell.favBtn.setImage(UIImage(named:"icons8-christmas-star-filled-500.png"), for: .normal)
            
        }
        else {
            cell.favBtn.setImage(UIImage(named: "icons8-christmas-star-500.png"), for: .normal)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204
    }
    
    
    @objc func favButtonClicked(sender: UIButton) {
        if (self.selectedItems.contains(sender.tag)) {
            let index1 = selectedItems.index(of:sender.tag)
            self.selectedItems.remove(at: index1!)
            print(selectedItems)
            
        }
        else {
            self.selectedItems.append(sender.tag)
        }
        
        print("thse are : \(selectedItems)")
        self.tablViw.reloadData()
    }
    

}

extension jobVC: SJSegmentedViewControllerViewSource {
    
    func viewForSegmentControllerToObserveContentOffsetChange() -> UIView {
        
        return tablViw
    }
}
