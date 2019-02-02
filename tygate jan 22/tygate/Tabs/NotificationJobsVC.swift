//
//  NotificationJobsVC.swift
//  tygate
//
//  Created by Dr Mohan Roop on 1/24/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class NotificationJobsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let webserviceController = WebserviceController.init()

    @IBOutlet weak var notificationTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationTblView.separatorStyle = .none
        title = "Notifications"
        //this is for navigation bar color
        navigationController?.navigationBar.barTintColor = UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        
        //this is for navigation bar text color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        //this is for tab bar color
        tabBarController?.tabBar.barTintColor =  UIColor.white

        // this is for tabbar text color
        tabBarController?.tabBar.tintColor = UIColor.darkGray
        
        navigationController?.navigationBar.topItem?.title = "Notification"

        self.navigationItem.title = "Notification"


        // this is for view gradient color
        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"NotificationTableViewCell" , for: indexPath) as! NotificationTableViewCell
        
        cell.textLbl.text = "notification tableview cell text demo notification tableview cell text demo notification tableview cell text demo minimumScaleFactor = 0.2 tableview cell text tableview cell text"
        
        cell.textLbl.adjustsFontSizeToFitWidth = true
        cell.textLbl.minimumScaleFactor = 0.2
        webserviceController.shadowView(view: cell.cellView)
        
        cell.selectionStyle = .none

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }


}
