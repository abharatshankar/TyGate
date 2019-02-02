//
//  homeJobsTabVC.swift
//  tygate
//
//  Created by Bharat shankar on 24/01/19.
//  Copyright © 2019 Bharat shankar. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class homeJobsTabVC: SJSegmentedViewController {
    var selectedSegment: SJSegmentTab?

    override func viewDidLoad() {
        if let storyboard = self.storyboard {
            
            let headerController = storyboard
                .instantiateViewController(withIdentifier: "HeaderViewController1")
            
            let firstViewController = storyboard
                .instantiateViewController(withIdentifier: "FirstTableViewController")
            firstViewController.title = "Nearby"
            
            let secondViewController = storyboard
                .instantiateViewController(withIdentifier: "SecondViewController")
            secondViewController.title = "Recent"
            
            let thirdViewController = storyboard
                .instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
            thirdViewController?.title = "Recomended"
            thirdViewController?.loadViewController = { (index) in
                self.setSelectedSegmentAt(index, animated: true)
            }
            
//            let fourthViewController = storyboard
//                .instantiateViewController(withIdentifier: "CollectionViewIdentifier")
//            fourthViewController.title = "Fourth"
            
            headerViewController = headerController
            segmentControllers = [firstViewController,
                                  secondViewController,
                                  thirdViewController!/*,
                                  fourthViewController*/]
            headerViewHeight = 100
            selectedSegmentViewHeight = 5.0
            headerViewOffsetHeight = 31.0
            segmentTitleColor = .gray
            selectedSegmentViewColor = .red
            segmentShadow = SJShadow.light()
            showsHorizontalScrollIndicator = false
            showsVerticalScrollIndicator = false
            segmentBounces = false
            delegate = self
            
            
            let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            statusBar.isHidden = true
        }
        
        title = "Jobs"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension homeJobsTabVC: SJSegmentedViewControllerDelegate {
    
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        
        if selectedSegment != nil {
            selectedSegment?.titleColor(.lightGray)
        }
        
        if segments.count > 0 {
            
            selectedSegment = segments[index]
            selectedSegment?.titleColor(.red)
        }
    }
}
