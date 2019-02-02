//
//  profileViewController.swift
//  tygate
//
//  Created by Bharat shankar on 25/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    let webserviceController = WebserviceController.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        
        //this is for navigation bar color
        navigationController?.navigationBar.barTintColor = UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        
        //this is for navigation bar text color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    @IBAction func preferencesAction(_ sender: Any) {
        
        
        let preference = storyboard?.instantiateViewController(withIdentifier: "preferencesViewController") as! preferencesViewController
        present(preference, animated: true, completion: nil)
        
    }
    
    @IBAction func educationAction(_ sender: Any) {
        let preference = storyboard?.instantiateViewController(withIdentifier: "educationViewController") as! educationViewController
        present(preference, animated: true, completion: nil)
        
    }
    @IBAction func expAction(_ sender: Any) {
        let preference = storyboard?.instantiateViewController(withIdentifier: "expViewController") as! expViewController
        present(preference, animated: true, completion: nil)
    }
    
    
    

}
