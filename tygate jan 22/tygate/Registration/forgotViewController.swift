//
//  forgotViewController.swift
//  tygate
//
//  Created by Bharat shankar on 21/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class forgotViewController: UIViewController , UITextFieldDelegate {
    let webserviceController = WebserviceController.init()

    @IBOutlet weak var mobileNumberText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        let webserviceController = WebserviceController.init()
        if  webserviceController.isValidPhoneNumber(self.mobileNumberText.text!) == true{
        
        }
    }
    
    
   
    
    //enter 10 digits in mobile field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let length: Int = textField.text?.count ?? 0
        if length > 9 && !(string == "") {
            return false
        }
        // This code will provide protection if user copy and paste more then 10 digit text
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            if (textField.text?.count ?? 0) > 10 {
                textField.text = (textField.text as? NSString)?.substring(to: 10)
            }
        })
        return true
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
