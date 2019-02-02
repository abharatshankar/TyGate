//
//  landedViewController.swift
//  tygate
//
//  Created by Bharat shankar on 26/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit

class landedViewController: UIViewController {
    var container: ContainerViewController!
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var buttonBar: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    let webserviceController = WebserviceController.init()
    var selectedIndex : Int = 0
    var selectedItems = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        segment.backgroundColor = UIColor.clear
        segment.tintColor = UIColor.clear
        segment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name:"HelveticaNeue",size:18)!,NSAttributedString.Key.foregroundColor:UIColor.white], for: .normal)
        
        segment.setTitleTextAttributes([NSAttributedString.Key.font :UIFont(name:"Palatino-Bold",size:20)!,NSAttributedString.Key.foregroundColor:UIColor.white], for: UIControl.State.selected)

        webserviceController.gradeientPatern(yourView : self.view, firstColor: UIColor(red: 76.0 / 255.0, green: 98.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor, secondColor: UIColor(red: 76.0 / 255.0, green: 166.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor)
        
        // Register to receive notification in your class
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // this is to set postion of segmented index first postion when viewwillappear calls
        segment.selectedSegmentIndex = 0
        buttonBar.frame.origin.x = (segment.frame.width/CGFloat(segment.numberOfSegments))*CGFloat(segment.selectedSegmentIndex)
    }
    
    // handle notification
    @objc func showSpinningWheel(_ notification: NSNotification) {
        
        if let strName = notification.userInfo?["id"] as? String {
            if (strName == "jobVC")
            {
                segment.selectedSegmentIndex = 0
                segmentControl(segment)
            }
            else if (strName == "recent")
            {
                segment.selectedSegmentIndex = 1
                segmentControl(segment)
            }
            else if (strName == "recomended")
            {
                segment.selectedSegmentIndex = 2
                segmentControl(segment)
            }
        }
    }
   
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        
        
        buttonBar.frame.origin.x = (segment.frame.width/CGFloat(segment.numberOfSegments))*CGFloat(segment.selectedSegmentIndex)
        
        if sender.selectedSegmentIndex == 0{
            
            
            container!.segueIdentifierReceivedFromParent("first")
            
        }else if(sender.selectedSegmentIndex == 2)
        {
            container!.segueIdentifierReceivedFromParent("third")
            
        }
        else{
            
            container!.segueIdentifierReceivedFromParent("second")
            
            
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            container = segue.destination as! ContainerViewController
            //For adding animation to the transition of containerviews you can use container's object property
            // animationDurationWithOptions and pass in the time duration and transition animation option as a tuple
            // Animations that can be used
            // .transitionFlipFromLeft, .transitionFlipFromRight, .transitionCurlUp
            // .transitionCurlDown, .transitionCrossDissolve, .transitionFlipFromTop
            container.animationDurationWithOptions = (0.5, .transitionCrossDissolve)
        }
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
