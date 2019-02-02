//
//  educationViewController.swift
//  tygate
//
//  Created by Bharat shankar on 29/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class educationViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell : educationTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "educationTableViewCell", for: indexPath) as? educationTableViewCell)!
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
        
    }
    
    
    @IBAction func closeBtnTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        print("add something")
        
    }
    
    
    @IBAction func okBtnTap(_ sender: Any) {
        
        
        let preference = storyboard?.instantiateViewController(withIdentifier: "educationDetailsViewController") as! educationDetailsViewController
        present(preference, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    

}
