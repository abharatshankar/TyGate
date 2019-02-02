//
//  recentTabViewController.swift
//  tygate
//
//  Created by Bharat shankar on 26/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class recentTabViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var recentTableView: UITableView!
    var selectedItems = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        self.recentTableView.addGestureRecognizer(leftSwipe)
        self.recentTableView.addGestureRecognizer(rightSwipe)
        
        
    }
    
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
            print("Swipe Left")
            
            
            let imageDataDict:[String: String] = ["id": "recomended"]
            // post a notification
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)
            
        }
        
        if (sender.direction == .right) {
            print("Swipe Right")
            
            let imageDataDict:[String: String] = ["id": "jobVC"]
            // post a notification
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)
            
        }
    }
    
    
//    @objc func favButtonClicked(sender: UIButton) {
//        if (self.selectedItems.contains(sender.tag)) {
//            let index1 = selectedItems.index(of:sender.tag)
//            self.selectedItems.remove(at: index1!)
//            print(selectedItems)
//
//        }
//        else {
//            self.selectedItems.append(sender.tag)
//        }
//
//        print("thse are : \(selectedItems)")
//        self.tablViw.reloadData()
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let cell : recentTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "recentTableViewCell", for: indexPath) as? recentTableViewCell)!
        
       // cell.favBtn.addTarget(self, action: #selector(favButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
        
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
        self.recentTableView.reloadData()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
