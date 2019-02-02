//
//  DefaultHelper.swift
//  Touchless
//
//  Created by Martijn De Bruijn on 06-11-17.
//  Copyright © 2017 Inventief-it. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DefaultsHelper{
    
    var preferences:UserDefaults!
    
    init(){
         preferences = UserDefaults.standard
    }
    
    
    func getSecret() -> String{
        if let secret = preferences.object(forKey: "secret") as? String{
            if secret != "" {
                return preferences.string(forKey: "secret")!
            }
        }
        //big else
//        self.signUpWithDevice()
        return ""
    }
    
    func setSecret(_ secret:String){
        preferences.set(secret, forKey: "secret")
        preferences.synchronize()
    }
    
    
    func setLoginInfo(_ jsonString:String){
        preferences.set(jsonString, forKey: "logininfo")
        preferences.set(false, forKey: "deviceloggedin")
        preferences.synchronize()
    }
    
    func getLoginInfo()->String{
        if let _ = preferences.object(forKey: "logininfo"){
            return preferences.string(forKey: "logininfo")!
        }else{
            return ""
        }
    }
    
    
    
    
    func setAuthKeyInfo(_ jsonString:String){
        preferences.set(jsonString, forKey: "AuthKeyInfo")
       
        preferences.synchronize()
    }
    
    func getAuthKeyInfo()->String{
        if let _ = preferences.object(forKey: "AuthKeyInfo"){
            return preferences.string(forKey: "AuthKeyInfo")!
        }else{
            return ""
        }
    }
    
    
    
    
    func setAuthKey(_ jsonString:String){
        preferences.set(jsonString, forKey: "AuthKey")
        
        preferences.synchronize()
    }
    
    func getAuthKey()->String{
        if let _ = preferences.object(forKey: "AuthKey"){
            return preferences.string(forKey: "AuthKey")!
        }else{
            return ""
        }
    }
    
    
    
    func setUserNameInfo(_ jsonString:String){
        preferences.set(jsonString, forKey: "UserNameInfo")
        
        preferences.synchronize()
    }
    
    func getUserNameInfo()->String{
        if let _ = preferences.object(forKey: "UserNameInfo"){
            return preferences.string(forKey: "UserNameInfo")!
        }else{
            return ""
        }
    }
    
    
    
    func setMobileNumberInfo(_ jsonString:String){
        preferences.set(jsonString, forKey: "MobileNumberInfo")
        
        preferences.synchronize()
    }
    
    func getMobileNumberInfo()->String{
        if let _ = preferences.object(forKey: "MobileNumberInfo"){
            return preferences.string(forKey: "MobileNumberInfo")!
        }else{
            return ""
        }
    }
    
    
    func setUserId(_ jsonString:String){
        preferences.set(jsonString, forKey: "UserId")
        
        preferences.synchronize()
    }
    
    func getUserId()->String{
        if let _ = preferences.object(forKey: "UserId"){
            return preferences.string(forKey: "UserId")!
        }else{
            return ""
        }
    }
    
    
    
    func setId(_ jsonString:String){
        preferences.set(jsonString, forKey: "Id")
        
        preferences.synchronize()
    }
    
    func getId()->String{
        if let _ = preferences.object(forKey: "Id"){
            return preferences.string(forKey: "Id")!
        }else{
            return ""
        }
    }
    
    func setUserIdInfo(_ jsonString:String){
        preferences.set(jsonString, forKey: "UserIdInfo")
        
        preferences.synchronize()
    }
    
    func getUserIdInfo()->String{
        if let _ = preferences.object(forKey: "UserIdInfo"){
            return preferences.string(forKey: "UserIdInfo")!
        }else{
            return ""
        }
    }
    
    
    func setSignupInfo(_ jsonString:String){
        preferences.set(jsonString, forKey: "signupInfo")
        preferences.set(false, forKey: "deviceloggedin")
        preferences.synchronize()
    }
    
    func getSignupInfo()->String{
        if let _ = preferences.object(forKey: "signupInfo"){
            return preferences.string(forKey: "signupInfo")!
        }else{
            return ""
        }
    }
    
    func setDeviceloggedIn(_ loggedIn:Bool){
        preferences.set(loggedIn, forKey: "deviceloggedin")
        preferences.synchronize()
    }
    
    func getDeviceLoggedIn() -> Bool{
        if let _ = preferences.object(forKey: "deviceloggedin"){
            return preferences.bool(forKey: "deviceloggedin")
        }else{
            return false
        }
    }
    
    func getUserData() -> JSON{
        if let _ = preferences.object(forKey: "logininfo"){
            let loginInfo:String = preferences.string(forKey: "logininfo")!
            
            //string to json
            var json:JSON!
            if let dataFromString = loginInfo.data(using: .utf8, allowLossyConversion: false) {
                
                
                do {
                    json = try JSON(data: dataFromString)
                } catch _ {
                    json = nil
                }
                
                //json = JSON(data: dataFromString)
            }
            let userData = json["data"]
            
            
            
            
            
            
            
            return userData
        }
        
        return JSON()
    }
    
    
   
}
