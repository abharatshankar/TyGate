//
//  recomendedTabViewController.swift
//  tygate
//
//  Created by Bharat shankar on 26/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class recomendedTabViewController: UIViewController , UITableViewDelegate,UITableViewDataSource ,CAAnimationDelegate{
    var selectedItems = [Int]()

    @IBOutlet weak var recomendedTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        self.recomendedTblView.addGestureRecognizer(rightSwipe)
        
        
    }
    
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .right) {
            print("Swipe right")
            
            let imageDataDict:[String: String] = ["id": "recent" , "from":"notificationReco"]
            // post a notification
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)
            
            //We can add some animation also
            DispatchQueue.main.async(execute: {
                let animation = CATransition()
                animation.type = CATransitionType.reveal
                animation.subtype = CATransitionSubtype.fromRight
                animation.duration = 0.5
                animation.delegate = self
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            })
            
        }
        
        if (sender.direction == .right) {
            print("Swipe Right")
            
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let cell : recentTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "recentTableView", for: indexPath) as? recentTableViewCell)!
        
       
        webserviceController.shadowView(view:  cell.cellView1)
        // cell.textLabel?.text = "Row " + String((indexPath as NSIndexPath).row)
        
        cell.favBtnReco.addTarget(self, action: #selector(favButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
        
        cell.favBtnReco.tag = indexPath.row
        if (selectedItems.contains(indexPath.row)) {
            
            cell.favBtnReco.setImage(UIImage(named:"icons8-christmas-star-filled-500.png"), for: .normal)
            
        }
        else {
            cell.favBtnReco.setImage(UIImage(named: "icons8-christmas-star-500.png"), for: .normal)
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
        self.recomendedTblView.reloadData()
    }
    

    

}
