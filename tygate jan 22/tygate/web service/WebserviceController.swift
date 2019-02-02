//
//  WebserviceController.swift
//  Touchless
//
//  Created by Martijn De Bruijn on 06-11-17.
//  Copyright © 2017 Inventief-it. All rights reserved.
//

import Alamofire
//import SwiftyJSON

class WebserviceController
{
    
    //Singup device without email password
    func signUpDevice(name:String, password:String, device_token:String, mobile_number:String ,device_type:String,type:String,facebook_id:String,google_id:String)
     {
        let url = API_SIGNUP_DEVICE
//        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "name":name,
            "mobile_number":mobile_number,
            "password":password,
            "device_type":"ios",
            "device_token":"987654",
            "type":"direct",
            "facebook_id":"",
            "google_id":"",
            "latitude":"",
            "longitude":""
        ]
        
        
        
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default).responseString
            { response in
            
            let result = response.result
            
            switch result
            {
            case .success(let value):
                print(value)
                let dict:[String:String] = ["data":value]
                NotificationCenter.default.post(name: CREATE_ACCOUNT_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    // mobile no. validation
    func isValidPhoneNumber(_ phoneNumberString: String) -> Bool {
        
        var returnValue = true
        //        let mobileRegEx = "^[789][0-9]{9,11}$"
        let mobileRegEx = "^[0-9]{10}$"
        
        do {
            let regex = try NSRegularExpression(pattern: mobileRegEx)
            let nsString = phoneNumberString as NSString
            let results = regex.matches(in: phoneNumberString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    
    // this method is to set gradinet color of background
    func gradeientPatern(yourView:UIView, firstColor:CGColor , secondColor:CGColor)  {
        let gl: CAGradientLayer
        let colorTop = firstColor
        let colorBottom =  secondColor
        
        gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [0.0, 1.0]
        yourView.backgroundColor = UIColor.clear
        let backgroundLayer = gl
        backgroundLayer.frame = yourView.frame
        yourView.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    //shadow view
    func shadowView(view: UIView)  {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 3
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true

        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func lineText(textBox: UITextField)  {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: textBox.frame.size.height - width, width: textBox.frame.size.width, height: textBox.frame.size.height)
        
        border.borderWidth = width
        textBox.layer.addSublayer(border)
        textBox.layer.masksToBounds = true
        
    }
    
    // this is to convert our nsstring response to json resonse
     func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    
    
    
    
    //   Login the user with email and password
    func aroundMe(_ storeType:String,_ latitude:String, _ longitude:String){
        let url = API_AROUND_ME_CATEGORIES_SERVICE
        
        
        
        
        
        let parameters:Parameters = [
            "type_of_store":storeType,
            "latitude":latitude,
            "longitude":longitude
        ]
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default).responseString { response in
            let result = response.result
            
            switch result{
            case .success(let value):
                print(value)
                let dict:[String:String] = ["data":value]
                NotificationCenter.default.post(name: AROUND_ME_CATEGORIES, object: nil, userInfo:dict)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    //login device
    func logInDevice(password:String, device_token:String, mobile_number:String ,device_type:String,auth_key:String)
    {
        let url = API_LOGIN_DEVICE
        //        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "mobile_number":mobile_number,
            "password":password,
            "device_type":"ios",
            "device_token":"987654",
            "auth_key":auth_key
        ]
    
       
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    
                     let defaultsHelper = DefaultsHelper.init()
                defaultsHelper.setUserIdInfo(value)
                    
                    let dict:[String:String] = ["":value]
                    NotificationCenter.default.post(name: LOG_IN_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    
    
    //verify otp
    func verifyOTP(mobile_number:String ,otp:String,auth_key:String)
    {
        let url = API_VERIFY_OTP
        //        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "mobile_number":mobile_number,
            "otp":otp,
            "auth_key":auth_key
        ]
        
       
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    let dict:[String:String] = ["data":value]
                    NotificationCenter.default.post(name: VERIFY_OTP_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    
    
    
    
    //resend otp
    func resendOtp(mobile_number:String,auth_key:String)
    {
        let url = API_RESEND_OTP
        //        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "mobile_number":mobile_number,
            "auth_key":auth_key
            
        ]
        
       
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    let dict:[String:String] = ["data":value]
                    NotificationCenter.default.post(name: RESEND_OTP_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    
    //forgot password
    func forgotpassword(mobile_number:String)
    {
        let url = API_FORGOT_PASSWORD
       
        
        let parameters:Parameters = [
            "mobile_number":mobile_number
            ]
        
        let keyArray : [String]
        
        keyArray = Array(parameters.keys)
        
        for validateKey in keyArray {
            if let checkKey  = parameters[validateKey]
            {
                print("value is there")
            }
            else
            {
                print("no value")
            }
        }
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    let dict:[String:String] = ["data":value]
                    NotificationCenter.default.post(name:FORGOT_PASSWORD_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    
    
    //profile
    func profile(user_id:String,auth_key:String)
    {
        let url = API_PROFILE
        //        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "user_id":user_id,
            "Api-key":auth_key
        ]
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "Api-key": auth_key
        ]
        
        
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default,headers: headers).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    let dict:[String:String] = ["data":value]
                    NotificationCenter.default.post(name:PROFILE_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    
    
    
    //editprofile
    func editprofile(user_id:String,auth_key:String,name:String)
    {
        let url = API_EDIT_PROFILE
        //        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "user_id":user_id,
            "name":name,
            "auth_key":auth_key
        ]
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "Api-key": auth_key
        ]
        
       
        
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default,headers: headers).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    let dict:[String:String] = ["data":value]
                    NotificationCenter.default.post(name:EDIT_PROFILE_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    //change password
    func changepassword(user_id:String,oldpassword:String,newpassword:String,auth_key:String)
    {
        let url = API_CHANGE_PASSWORD
        //        let phone_unique_device = UIDevice.current.identifierForVendor!.uuidString
        
        let parameters:Parameters = [
            "user_id":user_id,
            "oldpassword":oldpassword,
            "newpassword":newpassword,
            "auth_key":auth_key
        ]
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "Api-key": auth_key
        ]
        
    
        Alamofire.request(url,method: .post, parameters:parameters, encoding:URLEncoding.default,headers: headers).responseString
            { response in
                
                let result = response.result
                
                switch result
                {
                case .success(let value):
                    print(value)
                    let dict:[String:String] = ["data":value]
                    NotificationCenter.default.post(name:CHANGE_PASSWORD_WITH_DEVICE_NOTIFICATION, object: nil, userInfo:dict)
                case .failure(let error):
                    print(error)
                }
                
        }
    }

}
