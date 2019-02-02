//
//  otpViewController.swift
//  tygate
//
//  Created by Bharat shankar on 21/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class otpViewController: UIViewController {
    let webserviceController = WebserviceController.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        
        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
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
