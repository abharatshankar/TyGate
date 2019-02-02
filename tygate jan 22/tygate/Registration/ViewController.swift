//
//  ViewController.swift
//  tygate
//
//  Created by Bharat shankar on 21/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    let webserviceController = WebserviceController.init()

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var mobileNumText: UITextField!
    
    var iconClick = true

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordText.isSecureTextEntry = true

        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        

        
    }
    
    
    @IBAction func eyeAction(_ sender: Any) {
        //self.passwordText.isSecureTextEntry.toggle()

        if(iconClick == true) {
            self.passwordText.isSecureTextEntry = false
        } else {
            self.passwordText.isSecureTextEntry = true
        }

        iconClick = !iconClick
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
                textField.text = (textField.text as NSString?)?.substring(to: 10)
            }
        })
        return true
    }
    
    @IBAction func signInAction(_ sender: Any) {
        //call a sign in request
        let webserviceController = WebserviceController.init()
        print(webserviceController.isValidPhoneNumber(self.mobileNumText.text!))

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let ViewController = storyBoard.instantiateViewController(withIdentifier: "homePage") 
        self.present(ViewController, animated:true, completion:nil)
    }
    
}

