//
//  StaredJobsVC.swift
//  tygate
//
//  Created by Dr Mohan Roop on 1/24/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class StaredJobsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var jobsTblView: UITableView!
    let webserviceController = WebserviceController.init()


    override func viewDidLoad() {
        super.viewDidLoad()

        jobsTblView.separatorStyle = .none
        title = "Saved"
        //this is for navigation bar color
        navigationController?.navigationBar.barTintColor = UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        
        //this is for navigation bar text color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //this is for tab bar color
        tabBarController?.tabBar.barTintColor =  UIColor.white
        
        // this is for tabbar text color
        tabBarController?.tabBar.tintColor = UIColor.darkGray
        
        navigationController?.navigationBar.topItem?.title = "Saved"
        
        self.navigationItem.title = "Saved"
       
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"StaredTableViewCell" , for: indexPath) as! StaredTableViewCell
        
        webserviceController.shadowView(view: cell.cellView)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let jobDetail = storyboard?.instantiateViewController(withIdentifier: "JobDetailsVC") as! JobDetailsVC
        navigationController?.pushViewController(jobDetail, animated: false)
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
